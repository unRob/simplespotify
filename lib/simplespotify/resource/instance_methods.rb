module Resource

  module InstanceMethods

    attr_accessor :id, :uri, :href, :external_urls

    def initialize data, fetched: false
      @__props = []


      @fetched = fetched
      # puts "-NEW #{self.class.to_s} #{self.class._template.keys.join(',')}"
      [:id, :uri, :href, :external_urls].each do |k|

        if data[k]
          @__props << k
          instance_variable_set("@#{k}", data[k])
        end
      end

      self.class._template.each do |k, v|
        # puts "--EVAL #{self.class}"
        if v.is_a? Symbol
          _set(k, data[v])
        else
          key = v[:from]
          klass = SimpleSpotify::Model.const_get(v[:kind]) if v[:kind]

          data[key] = v[:default] if v[:default]
          unless data[key]
            next
          end

          case v[:type]
            when :real
              _set(k, (data[v] || v[:default]))
            when :virtual
              data[key].each(&method(:_set))
            when :resource_collection
              values = data[key]
              values = SimpleSpotify::Model::Collection.of(klass, values) if v[:paginated]
              _set(key, values)
            when :resource
              _set key, klass.new(data[key])
          end
        end

      end
    end


    def fetch! client=nil
      client = SimpleSpotify.default_client
      response = client.get(@href)
      self.class.new(response.body, fetched: true)
    end


    def link kind=:api
      case kind
        when :uri then @uri
        when :api then @href
        when :web then @external_urls && @external_urls[:spotify]
        when :preview then @preview_url
      end
    end


    def to_h
      tpls = self.class._template

      @__props.map {|v|
        value = send(v)
        tpl = tpls[v]

        if tpl.is_a?(Hash) && tpl[:type] != :virtual
          value = case tpl[:type]
            when :resource_collection then value.map(&:to_h)
            when :resource then value.to_h
          end
        end

        [v, value]
      }.to_h
    end


    private

    def _set key, value
      @__props << key
      _define(key) unless respond_to? key.to_sym
      send("#{key}=".to_sym, value)
    end

    def _define key
      key = key.to_sym
      self.class.__send__(:attr_accessor, key)
    end

  end

end
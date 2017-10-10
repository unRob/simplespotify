module SimpleSpotify
  module Model

    class Collection < Array

      attr_accessor :total

      def self.of type, collection, &refresh
        if type.is_a? Class
          model = type;
          prop = type.to_s.split('::').last.downcase+'s'
        else
          model_name = type.to_s.gsub(/s$/, '')
          model = Model.const_get(model_name.capitalize)
          prop = model_name+'s'
        end

        collection = {items: collection} unless collection.is_a? Hash
        prop = collection.has_key?(prop.to_sym) ? prop.to_sym : :items

        collection[prop].map! {|item| model.new(item) }
        self.new(collection, prop, &refresh)
      end


      def initialize data, property=:items, &refresh
        values = data[property]
        super values
        @total = data[:total] || self.count
        @next = data[:next]
        @refresh = refresh if block_given?
      end


      def total
        @total
      end


      def more?
        !@next.nil?
      end


      def more
        return [] unless more?
        if @refresh
          @refresh.call @next
        else
          req = Request.new(@next, {private: true})
          SimpleSpotify.dispatch(req)
        end
      end
    end #/class

  end
end

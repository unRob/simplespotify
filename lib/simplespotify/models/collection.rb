module SimpleSpotify
  module Model

    class Collection < Array

      attr_accessor :total

      def self.of type, data
        if type.is_a? Class
          model = type;
          prop = type.to_s.split('::').last.downcase+'s'
        else
          model_name = type.to_s.gsub(/s$/, '')
          model = Model.const_get(model_name.capitalize)
          prop = model_name+'s'
        end

        prop = prop.to_sym
        prop = :items unless data.has_key?(prop)

        data[prop].map! {|item| model.new(item) }
        self.new(data)
      end


      def initialize data, property=:items
        values = data[property]
        super values
        @total = data[:total] || self.count
        @next = data[:next]
      end


      def total
        @total
      end


      def more?
        !@next.nil?
      end


      def more
        return [] unless more?
        req = Request.new({endpoint: @next, private: false})
        SimpleSpotify.dispatch(req)
      end
    end #/class

  end
end

module Resource
  module ClassMethods

    def self.extended(base)
      super base
    end

    def prop name, o={}
      p = (o[:from] || name)
      p = {type: :real, from: p, default: o[:default]} if o[:default]
      @_template[name] = p
      attr_accessor name.to_sym
    end

    def many name, o={}
      attr_accessor name.to_sym
      kind = o[:kind] || name
      @_template[name] = {
        type: :resource_collection,
        kind: _constant(kind),
        from: name,
        paginated: o[:paginated] || false
      }
    end

    def one name, o={}
      attr_accessor name.to_sym
      kind = o[:kind] || name
      @_template[name] = {
        type: :resource,
        kind: _constant(kind),
        from: (o[:from] || name)
      }
    end

    def merge name
      @_template[name] = {type: :virtual, from: name}
    end

    def _template
      @_template
    end

    def _constant name
      "#{name}".gsub(/s$/, '').split('_').map(&:capitalize).join.to_sym
    end
  end
end
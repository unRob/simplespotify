module Resource

  autoload :ClassMethods, 'simplespotify/resource/class_methods'
  autoload :InstanceMethods, 'simplespotify/resource/instance_methods'

  def self.included(base)
    base.extend(ClassMethods)
    base.instance_variable_set("@_template", {})

    # base.extend(ClassMethods.dup);
    base.send :include, InstanceMethods
  end

end
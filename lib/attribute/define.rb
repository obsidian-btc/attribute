module Attribute
  class Define
    attr_reader :target_class
    attr_reader :attr_name
    attr_reader :visibility

    def initialize(target_class, attr_name, visibility=nil)
      visibility ||= :reader

      @target_class = target_class
      @attr_name = attr_name
      @visibility = visibility
    end

    def self.!(target_class, attr_name, visibility)
      instance = new target_class, attr_name, visibility
      instance.!
    end

    def !
      define_reader if [:reader, :accessor].include? visibility
      define_writer if [:writer, :accessor].include? visibility
    end

    def define_reader
      attr_name = self.attr_name
      target_class.send :define_method, attr_name do
        instance_variable_get("@#{attr_name}")
      end
    end

    def define_writer
      attr_name = self.attr_name
      target_class.send :define_method, "#{attr_name}=" do |value|
        instance_variable_set("@#{attr_name}", value)
      end
    end
  end
end

# Parses caster rules
# and returns list of Morf::Metadata::Attribute instances
# which contains casting rules
class Morf::AttributesParser

  # Performs casting
  # @param block [Proc] block with casting rules
  # @return Array(Morf::Metadata::Attribute) list of casting rules
  def self.parse(&block)
    dsl = DSL.new
    dsl.instance_exec(&block)
    dsl.attributes
  end

  class DSL
    attr_reader :attributes

    def initialize
      @attributes = []
    end

    # Redefined becase each class has the built in hash method
    def hash(*args, &block)
      method_missing(:hash, *args, &block)
    end

    def method_missing(caster_name, *args, &block)
      attr_name = args[0]
      options   = args[1] || {}
      caster = Morf.casters[caster_name]

      check_caster_exists!(caster, caster_name)
      check_attr_name_valid!(attr_name)
      check_options_is_hash!(options)

      attribute = Morf::Metadata::Attribute.new(attr_name, caster, options)
      if block_given?
        attribute.children = Morf::AttributesParser.parse(&block)
      end
      attributes << attribute
    end

    private

    def check_caster_exists!(caster, caster_name)
      if !caster
        raise Morf::Errors::CasterNotFoundError, "caster with name '#{caster_name}' is not found"
      end
    end

    def check_attr_name_valid!(attr_name)
      if !attr_name.is_a?(Symbol) && !attr_name.is_a?(String)
        raise Morf::Errors::ArgumentError, "attribute name should be a symbol or string"
      end
    end

    def check_options_is_hash!(options)
      if !options.is_a?(Hash)
        raise Morf::Errors::ArgumentError, "attribute options should be a Hash"
      end
    end
  end
end

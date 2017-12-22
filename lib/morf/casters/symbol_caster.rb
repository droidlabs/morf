class Morf::Casters::SymbolCaster
  MAX_SYMBOL_LENGTH = 1000

  def self.cast(value, attr_name, options = {})
    if value.is_a?(Symbol)
      value
    elsif value.is_a?(String)
      if value.length > MAX_SYMBOL_LENGTH
        raise Morf::Errors::CastingError, "is too long to be a symbol"
      else
        value.to_sym
      end
    else
      raise Morf::Errors::CastingError, "should be a symbol"
    end
  end
end

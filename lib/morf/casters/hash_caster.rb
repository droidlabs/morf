class Morf::Casters::HasMorfer
  def self.cast(value, attr_name, options = {})
    if value.is_a?(Hash)
      value
    else
      raise Morf::Errors::CastingError, "should be a hash"
    end
  end
end

class Morf::Casters::StringCaster
  def self.cast(value, attr_name, options = {})
    value.to_s
  end
end

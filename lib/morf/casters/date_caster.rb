require 'active_support/core_ext/date'

class Morf::Casters::DateCaster
  def self.cast(value, attr_name, options = {})
    if value.is_a?(Date)
      value
    elsif value.is_a?(String)
      begin
        Date.parse(value)
      rescue ArgumentError => e
        raise Morf::Errors::CastingError, "is invalid date"
      end
    else
      raise Morf::Errors::CastingError, "should be a date"
    end
  end
end

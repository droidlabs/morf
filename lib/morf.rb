require 'morf/version'
require 'morf/errors'
require 'morf/config'
require 'morf/casters'
require 'morf/concern.rb'
require 'morf/metadata/attribute'
require 'morf/attributes_parser'
require 'morf/attributes_caster'
require 'morf/caster'

module Morf
  @@casters = {}

  # Defines caster without adding own class
  # @note Not yet implemented
  def self.create(&block)
  end

  # Returns list of defined casters
  def self.casters
    @@casters
  end

  # Adds new casters to Morf
  # Allow extend Morf with your own casters
  # @param caster_name [Symbol] caster name
  # @param caster      [Class]  caster
  def self.add_caster(caster_name, caster)
    @@casters[caster_name] = caster
  end

  def self.config
    @@config ||= Morf::Config.new
  end
end

Morf.add_caster(:array,    Morf::Casters::ArrayCaster)
Morf.add_caster(:boolean,  Morf::Casters::BooleanCaster)
Morf.add_caster(:date,     Morf::Casters::DateCaster)
Morf.add_caster(:datetime, Morf::Casters::DateTimeCaster)
Morf.add_caster(:float,    Morf::Casters::FloatCaster)
Morf.add_caster(:hash,     Morf::Casters::HasMorfer)
Morf.add_caster(:integer,  Morf::Casters::IntegerCaster)
Morf.add_caster(:string,   Morf::Casters::StringCaster)
Morf.add_caster(:symbol,   Morf::Casters::SymbolCaster)
Morf.add_caster(:time,     Morf::Casters::TimeCaster)

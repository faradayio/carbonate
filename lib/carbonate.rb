require 'carbonate/record'

module Carbonate
  def self.field_map
    @field_map ||= {}
  end
  def self.field_map=(val)
    @field_map = val
  end

  def self.unit_map
    @unit_map ||= {}
  end
  def self.unit_map=(val)
    @unit_map = val
  end

  def self.type_map
    @type_map ||= {}
  end
  def self.type_map=(val)
    @type_map = val
  end

  def self.emitter
    @emitter
  end
  def self.emitter=(val)
    @emitter = val
  end
end

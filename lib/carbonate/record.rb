require 'alchemist'

module Carbonate
  class Record
    attr_accessor :row, :carbon, :methodology

    def initialize(input)
      self.row = input
    end

    def as_impact_query
      [Carbonate.emitter, Carbonate.field_map.inject({}) do |hsh, (cm1_field, table_field)|
        value = row[table_field]

        if local_unit = Carbonate.unit_map[cm1_field]
          value = value.to_f.send(local_unit).to(:kilograms)
        end
        if type = Carbonate.type_map[cm1_field]
          value = value.send "to_#{type}"
        end

        hsh[cm1_field] = value
        hsh
      end]
    end

    def to_csv
      (row.values + [carbon, methodology]).to_csv
    end
  end
end

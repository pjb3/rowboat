class Rowboat
  attr_accessor :columns, :rows

  def initialize(columns, rows)
    self.columns = columns
    self.rows = rows
  end

  def columns=(columns)
    @columns = columns.map{|c| self.class.parse_column_name(c) }
  end

  def each
    if columns && rows
      rows.each do |row|
        yield Hash[columns.zip(row)]
      end
    end
    nil
  end

  def to_a
    a = []
    each do |hash|
      a << hash
    end
    a
  end

  def self.parse_column_name(column_name)
    names = column_name.to_s.split('.').map(&:to_sym)

    #TODO: This doesn't really work, figure out how to build up a Hash of Hashes based on the Array of names

    if names.size > 1
      # ???
    else
      names.first
    end
  end
end

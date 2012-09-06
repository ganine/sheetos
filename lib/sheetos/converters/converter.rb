class Sheetos::Converter

  def self.encode(value)
    value.encode('UTF-8', :invalid => :replace, :undef => :replace, :replace => '?')
  end

  def self.ignore(value)
  end

  private

  def self.parse
    raise "You must implement the parse method on subclasses"
  end
end

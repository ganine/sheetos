class Sheetos::Converter

  def self.types
    %w(name phone email date downcased upcased capitalized ignore)
  end

  def self.encode(value)
    value.encode('UTF-8', invalid: :replace, :undef => :replace, replace: '?')
  end

  def self.downcased(value)
    encode(value).downcase
  end

  def self.upcased(value)
    encode(value).upcase
  end

  def self.capitalized(value)
    encode(value).capitalize
  end

  def self.ignore(value)
  end

  private

  def self.parse
    raise "You must implement the parse method on subclasses"
  end
end

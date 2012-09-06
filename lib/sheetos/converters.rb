require "#{File.dirname(__FILE__)}/converters/converter"

module Converters

  @@converters = { 'ignore' => Sheetos::Converter }
  Dir.glob("#{File.dirname(__FILE__)}/converters/*_converter.rb").each do |file|
    load file
    type = file.match(/converters\/(.*)_converter.rb/)[1]
    @@converters[type] = eval("Sheetos::#{type.capitalize}Converter")
  end

  def self.types
    @@converters.keys
  end

  def self.convert(type, value)
    @@converters[type].parse(value)
  end
end

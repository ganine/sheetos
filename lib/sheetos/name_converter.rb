class Sheetos::NameConverter < Sheetos::Converter
  def self.parse(name)

    name.gsub!(/(^"|"$)/, "")

    new_name = ''
    exceptions = %w(E Da Das De Di Do Dos)
    name.split(' ').each do |n|
      n.capitalize!
      n.downcase! if exceptions.include? n

      new_name << n + ' '
    end

    new_name.strip!
    new_name
  end
end

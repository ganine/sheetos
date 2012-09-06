class Sheetos::PhoneConverter < Sheetos::Converter

  def self.parse(phone)
    phone.gsub!(%r(\D), '')

    new_phone = ''
    separator = ';'
    phone.split(/[\/oue]/i).each do |v|
      case v
      when /^[0-9]{1,7}$/, /^[0-9]{9}$/, /^0[0-9]{1,9}$/
        v = ''
      when /^[0-9]{8}$/
        v = '31' + v[0, 8]
      when /^0[0-9]{10}$/
        v.slice!(0, 1)
      end

      new_phone << v + separator unless v.empty?
    end
    new_phone.chomp! separator

    new_phone
  end

end

class Sheetos::EmailConverter < Sheetos::Converter

  def self.parse(email)
    email.gsub!(/[?]/, "")
    email.gsub(/(^"|"$)/, "").downcase
  end

end

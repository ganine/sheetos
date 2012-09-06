class Sheetos::BirthdayConverter < Sheetos::Converter

  def self.parse(date)

    date.gsub!(/[. ]/, "")

    begin
      case date
      when /^\d{4}-\d{2}-\d{2}/
        Date.strptime("#{date[0, 10]}", '%Y-%m-%d')
      when /^\d{2}-\d{2}-\d{2}/
        Date.strptime("#{date[0, 8]}", '%y-%m-%d')

      when /^\d{2}\/\d{2}\/\d{4}/
        Date.strptime("#{date[0, 10]}", '%d/%m/%Y')
      when /^\d{2}\/\d{2}\/\d{2}/
        Date.strptime("#{date[0, 8]}", '%d/%m/%y')
      when /^\d{2}\/\d{2}/
        Date.strptime("#{date[0, 5]}", '%d/%m')

      when /^\d{1}\/\d{1}\/\d{4}/
        Date.strptime("#{date[0, 8]}", '%d/%m/%Y')
      when /^\d{1}\/\d{1}\/\d{2}/
        Date.strptime("#{date[0, 6]}", '%d/%m/%y')
      when /^\d{1}\/\d{1}/
        Date.strptime("#{date[0, 3]}", '%d/%m')

      when /^\d{1}\/\d{2}\/\d{4}/
        Date.strptime("#{date[0, 9]}", '%d/%m/%Y')
      when /^\d{1}\/\d{2}\/\d{2}/
        Date.strptime("#{date[0, 7]}", '%d/%m/%y')
      when /^\d{1}\/\d{2}/
        Date.strptime("#{date[0, 4]}", '%d/%m')

      when /^\d{2}\/\d{1}\/\d{4}/
        Date.strptime("#{date[0, 9]}", '%d/%m/%Y')
      when /^\d{2}\/\d{1}\/\d{2}/
        Date.strptime("#{date[0, 7]}", '%d/%m/%y')
      when /^\d{2}\/\d{1}/
        Date.strptime("#{date[0, 4]}", '%d/%m')

      when /\d{1}-[a-zA-Z]{3}/
        Date.strptime("#{date}", '%d-%b')
      end
    rescue ArgumentError => e
      raise "Invalid date format: #{date}"
    end

  end
end

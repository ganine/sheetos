require 'csv'
require 'roo'

class GenericSpreadsheet
  def basename
    File.basename(@filename)
  end
end

class Sheetos::Reader

  attr_reader :separator

  def initialize(file, headers)
    @file = file
    check_extension

    create_csv_file

    idenfity_separator

    @headers = headers
    check_headers
  end

  def check_extension
    @extension = File.extname(@file)

    raise ArgumentError, "Invalid extension" unless @extension =~ /\.(csv|txt|xls|xlsx|ods)$/
  end

  def create_csv_file
    case @extension
    when ".csv", ".txt"
      @csv = @file
    when ".xls"
      @csv = convert_to_csv(Excel.new(@file))
    when ".xlsx"
      @csv = convert_to_csv(Excelx.new(@file))
    when ".ods"
      @csv = convert_to_csv(Openoffice.new(@file))
    end
  end

  def idenfity_separator
    first_line = File.open(@csv){|f| f.readline }
    @separator = first_line[/;/] ? ';' : ','
  end

  def check_headers
    raise ArgumentError, "Invalid headers" unless have_converters_for?(@headers)
  end

  def read_until_line(number)
    File.open(@csv){|f| f.readlines[0, number]}
  end

  def process(has_header_line = false)

    table = CSV.read(@file,
                     :col_sep => @separator,
                     :headers => @headers,
                     :skip_blanks => true,
                     :converters => converters_methods)

    File.delete(@file) if @file[/tmp/]


    table.by_row!.delete(0) if has_header_line

    (table.by_col!.count - headers.size).times {table.delete -1}

    table
  end

  private

  def convert_to_csv(sheet)
    temp_file = "tmp/#{sheet.basename.downcase}_#{sheet.default_sheet.downcase}_temp.csv"
    sheet.to_csv(temp_file)
    temp_file
  end

  def have_converters_for?(headers)
    (headers - Converters.types).empty?
  end

  def converters_methods
    Converters.types.collect do |c|
      lambda {|f, info| info.header == c ? Converters.convert(c, f) : f}
    end
  end

end

require 'spec_helper'

describe Sheetos::Reader do

  let(:data) { "nome;celular;email\nmarcos;87654321;marcos@email.com;\nfelipe;88765432;felipe@email.com" }
  let(:result) { [ ["marcos","87654321","marcos@email.com"], ["felipe","88765432","felipe@email.com"] ] }

  it "raises an error if file not found" do
    expect { Sheetos::Reader.new }.to raise_error ArgumentError
  end

  it "raises an error if informed incorrect file type" do
    expect { Sheetos::Reader.new("whatever.ppt") }.to raise_error ArgumentError
  end

  it "indentifies column separator" do
    File.stub(:open).with("sheet.csv") { |f| data.split("\n").first }

    sheet = Sheetos::Reader.new("sheet.csv", %w(name phone email))
    sheet.separator.should == ";"
  end

  it "validates headers according with file and converters" do
    File.stub(:open).with("sheet.csv") { |f| data.split("\n").first }

    expect { Sheetos::Reader.new("sheet.csv", %w(invalid)) }.to raise_error ArgumentError

    # TODO should raise error when headers size bigger than columns
  end
end

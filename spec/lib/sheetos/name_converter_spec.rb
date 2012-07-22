require 'spec_helper'

describe Sheetos::NameConverter do

  it "capitalizes first letters of names except word connectors" do
    Sheetos::NameConverter.parse('MARCOS dE oliveira').should == 'Marcos de Oliveira'
  end

end

require 'spec_helper'

describe Sheetos::EmailConverter do

  it "remove not valid chacters" do
    Sheetos::EmailConverter.parse("marcos?@email.com").should == "marcos@email.com"
  end

  it "downcase all" do
    Sheetos::EmailConverter.parse("MARCOS@EMAIL.COM").should == "marcos@email.com"
  end

end

require 'spec_helper'

describe Sheetos::PhoneConverter do

  it "removes not numbers characters" do
    Sheetos::PhoneConverter.parse("cel: (31) 8765-4321").should == "3187654321"
  end

end

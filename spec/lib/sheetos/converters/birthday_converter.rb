require 'spec_helper'

describe Sheetos::BirthdayConverter do

  it "parses date in diferentes formats to YYYY-MM-DD" do
    Sheetos::BirthdayConverter.parse("22/07/2012").to_s.should == "2012-07-22"
  end

  it "validates if is a valid date" do
    expect { Sheetos::BirthdayConverter.parse("07/22/2012") }.to raise_error {
      ArgumentError
    }
  end

end

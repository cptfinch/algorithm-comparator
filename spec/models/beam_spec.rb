require File.dirname(__FILE__) + '/../spec_helper'

describe Beam do
  before(:each) do
    @beam = Beam.new
  end

  it "should be valid" do
    @beam.should be_valid
  end
end

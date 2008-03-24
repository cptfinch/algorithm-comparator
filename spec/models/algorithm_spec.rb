require File.dirname(__FILE__) + '/../spec_helper'

describe Algorithm do
  before(:each) do
    @algorithm = Algorithm.new
  end

  it "should be valid" do
    @algorithm.should be_valid
  end
end

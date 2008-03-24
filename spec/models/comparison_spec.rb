require File.dirname(__FILE__) + '/../spec_helper'

describe Comparison do
  before(:each) do
    @comparison = Comparison.new
  end

  it "should be valid" do
    @comparison.should be_valid
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe ComparisonType do
  before(:each) do
    @comparison_type = ComparisonType.new
  end

  it "should be valid" do
    @comparison_type.should be_valid
  end
end

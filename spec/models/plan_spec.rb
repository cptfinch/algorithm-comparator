require File.dirname(__FILE__) + '/../spec_helper'

describe Plan do
  before(:each) do
    @plan = Plan.new
  end

  it "should be valid" do
    @plan.should be_valid
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe AlgorithmComparisonJoin do
  before(:each) do
    @algorithm_comparison_join = AlgorithmComparisonJoin.new
  end

  it "should be valid" do
    @algorithm_comparison_join.should be_valid
  end
end

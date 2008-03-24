require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithm_comparison_joins/index.html.erb" do
  include AlgorithmComparisonJoinsHelper
  
  before do
    algorithm_comparison_join_98 = mock_model(AlgorithmComparisonJoin)
    algorithm_comparison_join_98.should_receive(:algorithm_id).and_return("1")
    algorithm_comparison_join_98.should_receive(:comparison_id).and_return("1")
    algorithm_comparison_join_99 = mock_model(AlgorithmComparisonJoin)
    algorithm_comparison_join_99.should_receive(:algorithm_id).and_return("1")
    algorithm_comparison_join_99.should_receive(:comparison_id).and_return("1")

    assigns[:algorithm_comparison_joins] = [algorithm_comparison_join_98, algorithm_comparison_join_99]
  end

  it "should render list of algorithm_comparison_joins" do
    render "/algorithm_comparison_joins/index.html.erb"
  end
end


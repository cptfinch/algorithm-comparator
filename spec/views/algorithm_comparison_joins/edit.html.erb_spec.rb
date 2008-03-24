require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithm_comparison_joins/edit.html.erb" do
  include AlgorithmComparisonJoinsHelper
  
  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    @algorithm_comparison_join.stub!(:algorithm_id).and_return("1")
    @algorithm_comparison_join.stub!(:comparison_id).and_return("1")
    assigns[:algorithm_comparison_join] = @algorithm_comparison_join
  end

  it "should render edit form" do
    render "/algorithm_comparison_joins/edit.html.erb"
    
    response.should have_tag("form[action=#{algorithm_comparison_join_path(@algorithm_comparison_join)}][method=post]") do
    end
  end
end



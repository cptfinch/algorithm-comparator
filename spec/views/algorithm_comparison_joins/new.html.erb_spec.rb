require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithm_comparison_joins/new.html.erb" do
  include AlgorithmComparisonJoinsHelper
  
  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    @algorithm_comparison_join.stub!(:new_record?).and_return(true)
    @algorithm_comparison_join.stub!(:algorithm_id).and_return("1")
    @algorithm_comparison_join.stub!(:comparison_id).and_return("1")
    assigns[:algorithm_comparison_join] = @algorithm_comparison_join
  end

  it "should render new form" do
    render "/algorithm_comparison_joins/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", algorithm_comparison_joins_path) do
    end
  end
end



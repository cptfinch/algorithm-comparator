require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparisons/new.html.erb" do
  include ComparisonsHelper
  
  before do
    @comparison = mock_model(Comparison)
    @comparison.stub!(:new_record?).and_return(true)
    @comparison.stub!(:name).and_return("MyString")
    @comparison.stub!(:result).and_return("9.99")
    @comparison.stub!(:comment).and_return("MyText")
    assigns[:comparison] = @comparison
    
    @plan = mock_model(Plan)
    @plan.stub!(:new_record?).and_return(true)
    @plan.stub!(:algorithm_id).and_return(1)
    assigns[:plan] = @plan
    
  end

  it "should render new form" do
    render "/comparisons/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", comparisons_path) do
      with_tag("input#comparison_name[name=?]", "comparison[name]")
      with_tag("input#comparison_result[name=?]", "comparison[result]")
      with_tag("textarea#comparison_comment[name=?]", "comparison[comment]")
      with_tag("input#plan_algorithm_id[name=?]", "plan[algorithm_id]")
    end
  end
end



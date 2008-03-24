require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparisons/edit.html.erb" do
  include ComparisonsHelper
  
  before do
    @comparison = mock_model(Comparison)
    @comparison.stub!(:name).and_return("MyString")
    @comparison.stub!(:result).and_return("9.99")
    @comparison.stub!(:comment).and_return("MyText")
    assigns[:comparison] = @comparison
  end

  it "should render edit form" do
    render "/comparisons/edit.html.erb"
    
    response.should have_tag("form[action=#{comparison_path(@comparison)}][method=post]") do
      with_tag('input#comparison_name[name=?]', "comparison[name]")
      with_tag('input#comparison_result[name=?]', "comparison[result]")
      with_tag('textarea#comparison_comment[name=?]', "comparison[comment]")
    end
  end
end



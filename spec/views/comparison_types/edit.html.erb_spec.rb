require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparison_types/edit.html.erb" do
  include ComparisonTypesHelper
  
  before do
    @comparison_type = mock_model(ComparisonType)
    @comparison_type.stub!(:name).and_return("MyString")
    @comparison_type.stub!(:algorithm_comparison_join_id).and_return("1")
    @comparison_type.stub!(:tolerance).and_return("9.99")
    assigns[:comparison_type] = @comparison_type
  end

  it "should render edit form" do
    render "/comparison_types/edit.html.erb"
    
    response.should have_tag("form[action=#{comparison_type_path(@comparison_type)}][method=post]") do
      with_tag('input#comparison_type_name[name=?]', "comparison_type[name]")
      with_tag('input#comparison_type_tolerance[name=?]', "comparison_type[tolerance]")
    end
  end
end



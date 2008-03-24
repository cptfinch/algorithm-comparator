require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparison_types/show.html.erb" do
  include ComparisonTypesHelper
  
  before do
    @comparison_type = mock_model(ComparisonType)
    @comparison_type.stub!(:name).and_return("MyString")
    @comparison_type.stub!(:algorithm_comparison_join_id).and_return("1")
    @comparison_type.stub!(:tolerance).and_return("9.99")

    assigns[:comparison_type] = @comparison_type
  end

  it "should render attributes in <p>" do
    render "/comparison_types/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/9\.99/)
  end
end


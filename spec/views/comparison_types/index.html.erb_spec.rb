require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparison_types/index.html.erb" do
  include ComparisonTypesHelper
  
  before do
    comparison_type_98 = mock_model(ComparisonType)
    comparison_type_98.should_receive(:name).and_return("MyString")
    comparison_type_98.should_receive(:algorithm_comparison_join_id).and_return("1")
    comparison_type_98.should_receive(:tolerance).and_return("9.99")
    comparison_type_99 = mock_model(ComparisonType)
    comparison_type_99.should_receive(:name).and_return("MyString")
    comparison_type_99.should_receive(:algorithm_comparison_join_id).and_return("1")
    comparison_type_99.should_receive(:tolerance).and_return("9.99")

    assigns[:comparison_types] = [comparison_type_98, comparison_type_99]
  end

  it "should render list of comparison_types" do
    render "/comparison_types/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "9.99", 2)
  end
end


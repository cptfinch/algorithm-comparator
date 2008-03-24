require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparisons/index.html.erb" do
  include ComparisonsHelper
  
  before do
    comparison_98 = mock_model(Comparison)
    comparison_98.should_receive(:name).and_return("MyString")
    comparison_98.should_receive(:result).and_return("9.99")
    comparison_98.should_receive(:comment).and_return("MyText")
    comparison_99 = mock_model(Comparison)
    comparison_99.should_receive(:name).and_return("MyString")
    comparison_99.should_receive(:result).and_return("9.99")
    comparison_99.should_receive(:comment).and_return("MyText")

    assigns[:comparisons] = [comparison_98, comparison_99]
  end

  it "should render list of comparisons" do
    render "/comparisons/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "9.99", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end


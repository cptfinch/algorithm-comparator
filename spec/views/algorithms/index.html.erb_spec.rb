require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithms/index.html.erb" do
  include AlgorithmsHelper
  
  before do
    algorithm_98 = mock_model(Algorithm)
    algorithm_98.should_receive(:name).and_return("MyString")
    algorithm_99 = mock_model(Algorithm)
    algorithm_99.should_receive(:name).and_return("MyString")

    assigns[:algorithms] = [algorithm_98, algorithm_99]
  end

  it "should render list of algorithms" do
    render "/algorithms/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end


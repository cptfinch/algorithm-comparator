require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithms/show.html.erb" do
  include AlgorithmsHelper
  
  before do
    @algorithm = mock_model(Algorithm)
    @algorithm.stub!(:name).and_return("MyString")

    assigns[:algorithm] = @algorithm
  end

  it "should render attributes in <p>" do
    render "/algorithms/show.html.erb"
    response.should have_text(/MyString/)
  end
end


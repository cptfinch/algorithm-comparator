require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithms/new.html.erb" do
  include AlgorithmsHelper
  
  before do
    @algorithm = mock_model(Algorithm)
    @algorithm.stub!(:new_record?).and_return(true)
    @algorithm.stub!(:name).and_return("MyString")
    assigns[:algorithm] = @algorithm
  end

  it "should render new form" do
    render "/algorithms/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", algorithms_path) do
      with_tag("input#algorithm_name[name=?]", "algorithm[name]")
    end
  end
end



require File.dirname(__FILE__) + '/../../spec_helper'

describe "/algorithms/edit.html.erb" do
  include AlgorithmsHelper
  
  before do
    @algorithm = mock_model(Algorithm)
    @algorithm.stub!(:name).and_return("MyString")
    assigns[:algorithm] = @algorithm
  end

  it "should render edit form" do
    render "/algorithms/edit.html.erb"
    
    response.should have_tag("form[action=#{algorithm_path(@algorithm)}][method=post]") do
      with_tag('input#algorithm_name[name=?]', "algorithm[name]")
    end
  end
end



require File.dirname(__FILE__) + '/../../spec_helper'

describe "/comparisons/show.html.erb" do
  include ComparisonsHelper
  
  before do
    @comparison = mock_model(Comparison)
    @comparison.stub!(:name).and_return("MyString")
    @comparison.stub!(:result).and_return("9.99")
    @comparison.stub!(:comment).and_return("MyText")

    assigns[:comparison] = @comparison
  end

  it "should render attributes in <p>" do
    render "/comparisons/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/9\.99/)
    response.should have_text(/MyText/)
  end
end


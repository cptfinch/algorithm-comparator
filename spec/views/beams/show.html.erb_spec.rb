require File.dirname(__FILE__) + '/../../spec_helper'

describe "/beams/show.html.erb" do
  include BeamsHelper
  
  before do
    @beam = mock_model(Beam)
    @beam.stub!(:number).and_return("1")
    @beam.stub!(:value).and_return("9.99")

    assigns[:beam] = @beam
  end

  it "should render attributes in <p>" do
    render "/beams/show.html.erb"
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
  end
end


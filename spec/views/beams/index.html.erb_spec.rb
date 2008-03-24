require File.dirname(__FILE__) + '/../../spec_helper'

describe "/beams/index.html.erb" do
  include BeamsHelper
  
  before do
    beam_98 = mock_model(Beam)
    beam_98.should_receive(:number).and_return("1")
    beam_98.should_receive(:value).and_return("9.99")
    beam_99 = mock_model(Beam)
    beam_99.should_receive(:number).and_return("1")
    beam_99.should_receive(:value).and_return("9.99")

    assigns[:beams] = [beam_98, beam_99]
  end

  it "should render list of beams" do
    render "/beams/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "9.99", 2)
  end
end


require File.dirname(__FILE__) + '/../../spec_helper'

describe "/beams/edit.html.erb" do
  include BeamsHelper
  
  before do
    @beam = mock_model(Beam)
    @beam.stub!(:number).and_return("1")
    @beam.stub!(:value).and_return("9.99")
    assigns[:beam] = @beam
  end

  it "should render edit form" do
    render "/beams/edit.html.erb"
    
    response.should have_tag("form[action=#{beam_path(@beam)}][method=post]") do
      with_tag('input#beam_number[name=?]', "beam[number]")
      with_tag('input#beam_value[name=?]', "beam[value]")
    end
  end
end



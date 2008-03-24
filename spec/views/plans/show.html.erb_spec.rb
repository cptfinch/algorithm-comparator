require File.dirname(__FILE__) + '/../../spec_helper'

describe "/plans/show.html.erb" do
  include PlansHelper
  
  before do
    @plan = mock_model(Plan)
    @plan.stub!(:algorithm_id).and_return("1")

    assigns[:plan] = @plan
  end

  it "should render attributes in <p>" do
    render "/plans/show.html.erb"
  end
end


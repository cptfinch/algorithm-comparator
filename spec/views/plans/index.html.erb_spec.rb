require File.dirname(__FILE__) + '/../../spec_helper'

describe "/plans/index.html.erb" do
  include PlansHelper
  
  before do
    plan_98 = mock_model(Plan)
    plan_98.should_receive(:algorithm_id).and_return("1")
    plan_99 = mock_model(Plan)
    plan_99.should_receive(:algorithm_id).and_return("1")

    assigns[:plans] = [plan_98, plan_99]
  end

  it "should render list of plans" do
    render "/plans/index.html.erb"
  end
end


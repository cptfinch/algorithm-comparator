require File.dirname(__FILE__) + '/../../spec_helper'

describe "/plans/edit.html.erb" do
  include PlansHelper
  
  before do
    @plan = mock_model(Plan)
    @plan.stub!(:algorithm_id).and_return("1")
    assigns[:plan] = @plan
  end

  it "should render edit form" do
    render "/plans/edit.html.erb"
    
    response.should have_tag("form[action=#{plan_path(@plan)}][method=post]") do
    end
  end
end



require File.dirname(__FILE__) + '/../../spec_helper'

describe "/plans/new.html.erb" do
  include PlansHelper
  
  before do
    @plan = mock_model(Plan)
    @plan.stub!(:new_record?).and_return(true)
    @plan.stub!(:algorithm_id).and_return("1")
    assigns[:plan] = @plan
  end

  it "should render new form" do
    render "/plans/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", plans_path) do
    end
  end
end



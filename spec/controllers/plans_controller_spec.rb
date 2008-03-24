require File.dirname(__FILE__) + '/../spec_helper'

describe PlansController, "#route_for" do

  it "should map { :controller => 'plans', :action => 'index' } to /plans" do
    route_for(:controller => "plans", :action => "index").should == "/plans"
  end
  
  it "should map { :controller => 'plans', :action => 'new' } to /plans/new" do
    route_for(:controller => "plans", :action => "new").should == "/plans/new"
  end
  
  it "should map { :controller => 'plans', :action => 'show', :id => 1 } to /plans/1" do
    route_for(:controller => "plans", :action => "show", :id => 1).should == "/plans/1"
  end
  
  it "should map { :controller => 'plans', :action => 'edit', :id => 1 } to /plans/1/edit" do
    route_for(:controller => "plans", :action => "edit", :id => 1).should == "/plans/1/edit"
  end
  
  it "should map { :controller => 'plans', :action => 'update', :id => 1} to /plans/1" do
    route_for(:controller => "plans", :action => "update", :id => 1).should == "/plans/1"
  end
  
  it "should map { :controller => 'plans', :action => 'destroy', :id => 1} to /plans/1" do
    route_for(:controller => "plans", :action => "destroy", :id => 1).should == "/plans/1"
  end
  
end

describe PlansController, "#params_from" do

  it "should generate params { :controller => 'plans', action => 'index' } from GET /plans" do
    params_from(:get, "/plans").should == {:controller => "plans", :action => "index"}
  end
  
  it "should generate params { :controller => 'plans', action => 'new' } from GET /plans/new" do
    params_from(:get, "/plans/new").should == {:controller => "plans", :action => "new"}
  end
  
  it "should generate params { :controller => 'plans', action => 'create' } from POST /plans" do
    params_from(:post, "/plans").should == {:controller => "plans", :action => "create"}
  end
  
  it "should generate params { :controller => 'plans', action => 'show', id => '1' } from GET /plans/1" do
    params_from(:get, "/plans/1").should == {:controller => "plans", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'plans', action => 'edit', id => '1' } from GET /plans/1;edit" do
    params_from(:get, "/plans/1/edit").should == {:controller => "plans", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'plans', action => 'update', id => '1' } from PUT /plans/1" do
    params_from(:put, "/plans/1").should == {:controller => "plans", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'plans', action => 'destroy', id => '1' } from DELETE /plans/1" do
    params_from(:delete, "/plans/1").should == {:controller => "plans", :action => "destroy", :id => "1"}
  end
  
end

describe PlansController, "handling GET /plans" do

  before do
    @plan = mock_model(Plan)
    Plan.stub!(:find).and_return([@plan])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all plans" do
    Plan.should_receive(:find).with(:all).and_return([@plan])
    do_get
  end
  
  it "should assign the found plans for the view" do
    do_get
    assigns[:plans].should == [@plan]
  end
end

describe PlansController, "handling GET /plans.xml" do

  before do
    @plan = mock_model(Plan, :to_xml => "XML")
    Plan.stub!(:find).and_return(@plan)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all plans" do
    Plan.should_receive(:find).with(:all).and_return([@plan])
    do_get
  end
  
  it "should render the found plans as xml" do
    @plan.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PlansController, "handling GET /plans/1" do

  before do
    @plan = mock_model(Plan)
    Plan.stub!(:find).and_return(@plan)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the plan requested" do
    Plan.should_receive(:find).with("1").and_return(@plan)
    do_get
  end
  
  it "should assign the found plan for the view" do
    do_get
    assigns[:plan].should equal(@plan)
  end
end

describe PlansController, "handling GET /plans/1.xml" do

  before do
    @plan = mock_model(Plan, :to_xml => "XML")
    Plan.stub!(:find).and_return(@plan)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the plan requested" do
    Plan.should_receive(:find).with("1").and_return(@plan)
    do_get
  end
  
  it "should render the found plan as xml" do
    @plan.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PlansController, "handling GET /plans/new" do

  before do
    @plan = mock_model(Plan)
    Plan.stub!(:new).and_return(@plan)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new plan" do
    Plan.should_receive(:new).and_return(@plan)
    do_get
  end
  
  it "should not save the new plan" do
    @plan.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new plan for the view" do
    do_get
    assigns[:plan].should equal(@plan)
  end
end

describe PlansController, "handling GET /plans/1/edit" do

  before do
    @plan = mock_model(Plan)
    Plan.stub!(:find).and_return(@plan)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the plan requested" do
    Plan.should_receive(:find).and_return(@plan)
    do_get
  end
  
  it "should assign the found Plan for the view" do
    do_get
    assigns[:plan].should equal(@plan)
  end
end

describe PlansController, "handling POST /plans" do

  before do
    @plan = mock_model(Plan, :to_param => "1")
    Plan.stub!(:new).and_return(@plan)
  end
  
  def post_with_successful_save
    @plan.should_receive(:save).and_return(true)
    post :create, :plan => {}
  end
  
  def post_with_failed_save
    @plan.should_receive(:save).and_return(false)
    post :create, :plan => {}
  end
  
  it "should create a new plan" do
    Plan.should_receive(:new).with({}).and_return(@plan)
    post_with_successful_save
  end

  it "should redirect to the new plan on successful save" do
    post_with_successful_save
    response.should redirect_to(plan_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe PlansController, "handling PUT /plans/1" do

  before do
    @plan = mock_model(Plan, :to_param => "1")
    Plan.stub!(:find).and_return(@plan)
  end
  
  def put_with_successful_update
    @plan.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @plan.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the plan requested" do
    Plan.should_receive(:find).with("1").and_return(@plan)
    put_with_successful_update
  end

  it "should update the found plan" do
    put_with_successful_update
    assigns(:plan).should equal(@plan)
  end

  it "should assign the found plan for the view" do
    put_with_successful_update
    assigns(:plan).should equal(@plan)
  end

  it "should redirect to the plan on successful update" do
    put_with_successful_update
    response.should redirect_to(plan_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe PlansController, "handling DELETE /plans/1" do

  before do
    @plan = mock_model(Plan, :destroy => true)
    Plan.stub!(:find).and_return(@plan)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the plan requested" do
    Plan.should_receive(:find).with("1").and_return(@plan)
    do_delete
  end
  
  it "should call destroy on the found plan" do
    @plan.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the plans list" do
    do_delete
    response.should redirect_to(plans_url)
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe ComparisonsController, "#route_for" do

  it "should map { :controller => 'comparisons', :action => 'index' } to /comparisons" do
    route_for(:controller => "comparisons", :action => "index").should == "/comparisons"
  end
  
  it "should map { :controller => 'comparisons', :action => 'new' } to /comparisons/new" do
    route_for(:controller => "comparisons", :action => "new").should == "/comparisons/new"
  end
  
  it "should map { :controller => 'comparisons', :action => 'show', :id => 1 } to /comparisons/1" do
    route_for(:controller => "comparisons", :action => "show", :id => 1).should == "/comparisons/1"
  end
  
  it "should map { :controller => 'comparisons', :action => 'edit', :id => 1 } to /comparisons/1/edit" do
    route_for(:controller => "comparisons", :action => "edit", :id => 1).should == "/comparisons/1/edit"
  end
  
  it "should map { :controller => 'comparisons', :action => 'update', :id => 1} to /comparisons/1" do
    route_for(:controller => "comparisons", :action => "update", :id => 1).should == "/comparisons/1"
  end
  
  it "should map { :controller => 'comparisons', :action => 'destroy', :id => 1} to /comparisons/1" do
    route_for(:controller => "comparisons", :action => "destroy", :id => 1).should == "/comparisons/1"
  end
  
end

describe ComparisonsController, "#params_from" do

  it "should generate params { :controller => 'comparisons', action => 'index' } from GET /comparisons" do
    params_from(:get, "/comparisons").should == {:controller => "comparisons", :action => "index"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'new' } from GET /comparisons/new" do
    params_from(:get, "/comparisons/new").should == {:controller => "comparisons", :action => "new"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'create' } from POST /comparisons" do
    params_from(:post, "/comparisons").should == {:controller => "comparisons", :action => "create"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'show', id => '1' } from GET /comparisons/1" do
    params_from(:get, "/comparisons/1").should == {:controller => "comparisons", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'edit', id => '1' } from GET /comparisons/1;edit" do
    params_from(:get, "/comparisons/1/edit").should == {:controller => "comparisons", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'update', id => '1' } from PUT /comparisons/1" do
    params_from(:put, "/comparisons/1").should == {:controller => "comparisons", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparisons', action => 'destroy', id => '1' } from DELETE /comparisons/1" do
    params_from(:delete, "/comparisons/1").should == {:controller => "comparisons", :action => "destroy", :id => "1"}
  end
  
end

describe ComparisonsController, "handling GET /comparisons" do

  before do
    @comparison = mock_model(Comparison)
    Comparison.stub!(:find).and_return([@comparison])
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
  
  it "should find all comparisons" do
    Comparison.should_receive(:find).with(:all).and_return([@comparison])
    do_get
  end
  
  it "should assign the found comparisons for the view" do
    do_get
    assigns[:comparisons].should == [@comparison]
  end
end

describe ComparisonsController, "handling GET /comparisons.xml" do

  before do
    @comparison = mock_model(Comparison, :to_xml => "XML")
    Comparison.stub!(:find).and_return(@comparison)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all comparisons" do
    Comparison.should_receive(:find).with(:all).and_return([@comparison])
    do_get
  end
  
  it "should render the found comparisons as xml" do
    @comparison.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ComparisonsController, "handling GET /comparisons/1" do

  before do
    @comparison = mock_model(Comparison)
    Comparison.stub!(:find).and_return(@comparison)
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
  
  it "should find the comparison requested" do
    Comparison.should_receive(:find).with("1").and_return(@comparison)
    do_get
  end
  
  it "should assign the found comparison for the view" do
    do_get
    assigns[:comparison].should equal(@comparison)
  end
end

describe ComparisonsController, "handling GET /comparisons/1.xml" do

  before do
    @comparison = mock_model(Comparison, :to_xml => "XML")
    Comparison.stub!(:find).and_return(@comparison)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the comparison requested" do
    Comparison.should_receive(:find).with("1").and_return(@comparison)
    do_get
  end
  
  it "should render the found comparison as xml" do
    @comparison.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ComparisonsController, "handling GET /comparisons/new" do

  before do
    @comparison = mock_model(Comparison)
    Comparison.stub!(:new).and_return(@comparison)
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
  
  it "should create an new comparison" do
    Comparison.should_receive(:new).and_return(@comparison)
    do_get
  end
  
  it "should create two new plans" do
    Plan.should_receive(:new).and_return(@plan) 
    do_get
  end
  
  it "should not save the new comparison" do
    @comparison.should_not_receive(:save)
    do_get
  end

  it "should not save the new plans" do
    @plan.should_not_receive(:save)
    do_get
  end

  it "should assign the new comparison for the view" do
    do_get
    assigns[:comparison].should equal(@comparison)
  end
  
  it "should assign the new plan for the view" do
    do_get
    assigns[:plan].should equal(@plan)
  end
end

describe ComparisonsController, "handling GET /comparisons/1/edit" do

  before do
    @comparison = mock_model(Comparison)
    Comparison.stub!(:find).and_return(@comparison)
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
  
  it "should find the comparison requested" do
    Comparison.should_receive(:find).and_return(@comparison)
    do_get
  end
  
  it "should assign the found Comparison for the view" do
    do_get
    assigns[:comparison].should equal(@comparison)
  end
end

describe ComparisonsController, "handling POST /comparisons" do

  before do
    @comparison = mock_model(Comparison, :to_param => "1")
    Comparison.stub!(:new).and_return(@comparison)
  end
  
  def post_with_successful_save
    @comparison.should_receive(:save).and_return(true)
    post :create, :comparison => {}
  end
  
  def post_with_failed_save
    @comparison.should_receive(:save).and_return(false)
    post :create, :comparison => {}
  end
  
  it "should create a new comparison" do
    Comparison.should_receive(:new).with({}).and_return(@comparison)
    post_with_successful_save
  end

  it "should redirect to the new comparison on successful save" do
    post_with_successful_save
    response.should redirect_to(comparison_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe ComparisonsController, "handling PUT /comparisons/1" do

  before do
    @comparison = mock_model(Comparison, :to_param => "1")
    Comparison.stub!(:find).and_return(@comparison)
  end
  
  def put_with_successful_update
    @comparison.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @comparison.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the comparison requested" do
    Comparison.should_receive(:find).with("1").and_return(@comparison)
    put_with_successful_update
  end

  it "should update the found comparison" do
    put_with_successful_update
    assigns(:comparison).should equal(@comparison)
  end

  it "should assign the found comparison for the view" do
    put_with_successful_update
    assigns(:comparison).should equal(@comparison)
  end

  it "should redirect to the comparison on successful update" do
    put_with_successful_update
    response.should redirect_to(comparison_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe ComparisonsController, "handling DELETE /comparisons/1" do

  before do
    @comparison = mock_model(Comparison, :destroy => true)
    Comparison.stub!(:find).and_return(@comparison)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the comparison requested" do
    Comparison.should_receive(:find).with("1").and_return(@comparison)
    do_delete
  end
  
  it "should call destroy on the found comparison" do
    @comparison.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the comparisons list" do
    do_delete
    response.should redirect_to(comparisons_url)
  end
end

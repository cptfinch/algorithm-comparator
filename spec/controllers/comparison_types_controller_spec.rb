require File.dirname(__FILE__) + '/../spec_helper'

describe ComparisonTypesController, "#route_for" do

  it "should map { :controller => 'comparison_types', :action => 'index' } to /comparison_types" do
    route_for(:controller => "comparison_types", :action => "index").should == "/comparison_types"
  end
  
  it "should map { :controller => 'comparison_types', :action => 'new' } to /comparison_types/new" do
    route_for(:controller => "comparison_types", :action => "new").should == "/comparison_types/new"
  end
  
  it "should map { :controller => 'comparison_types', :action => 'show', :id => 1 } to /comparison_types/1" do
    route_for(:controller => "comparison_types", :action => "show", :id => 1).should == "/comparison_types/1"
  end
  
  it "should map { :controller => 'comparison_types', :action => 'edit', :id => 1 } to /comparison_types/1/edit" do
    route_for(:controller => "comparison_types", :action => "edit", :id => 1).should == "/comparison_types/1/edit"
  end
  
  it "should map { :controller => 'comparison_types', :action => 'update', :id => 1} to /comparison_types/1" do
    route_for(:controller => "comparison_types", :action => "update", :id => 1).should == "/comparison_types/1"
  end
  
  it "should map { :controller => 'comparison_types', :action => 'destroy', :id => 1} to /comparison_types/1" do
    route_for(:controller => "comparison_types", :action => "destroy", :id => 1).should == "/comparison_types/1"
  end
  
end

describe ComparisonTypesController, "#params_from" do

  it "should generate params { :controller => 'comparison_types', action => 'index' } from GET /comparison_types" do
    params_from(:get, "/comparison_types").should == {:controller => "comparison_types", :action => "index"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'new' } from GET /comparison_types/new" do
    params_from(:get, "/comparison_types/new").should == {:controller => "comparison_types", :action => "new"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'create' } from POST /comparison_types" do
    params_from(:post, "/comparison_types").should == {:controller => "comparison_types", :action => "create"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'show', id => '1' } from GET /comparison_types/1" do
    params_from(:get, "/comparison_types/1").should == {:controller => "comparison_types", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'edit', id => '1' } from GET /comparison_types/1;edit" do
    params_from(:get, "/comparison_types/1/edit").should == {:controller => "comparison_types", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'update', id => '1' } from PUT /comparison_types/1" do
    params_from(:put, "/comparison_types/1").should == {:controller => "comparison_types", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'comparison_types', action => 'destroy', id => '1' } from DELETE /comparison_types/1" do
    params_from(:delete, "/comparison_types/1").should == {:controller => "comparison_types", :action => "destroy", :id => "1"}
  end
  
end

describe ComparisonTypesController, "handling GET /comparison_types" do

  before do
    @comparison_type = mock_model(ComparisonType)
    ComparisonType.stub!(:find).and_return([@comparison_type])
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
  
  it "should find all comparison_types" do
    ComparisonType.should_receive(:find).with(:all).and_return([@comparison_type])
    do_get
  end
  
  it "should assign the found comparison_types for the view" do
    do_get
    assigns[:comparison_types].should == [@comparison_type]
  end
end

describe ComparisonTypesController, "handling GET /comparison_types.xml" do

  before do
    @comparison_type = mock_model(ComparisonType, :to_xml => "XML")
    ComparisonType.stub!(:find).and_return(@comparison_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all comparison_types" do
    ComparisonType.should_receive(:find).with(:all).and_return([@comparison_type])
    do_get
  end
  
  it "should render the found comparison_types as xml" do
    @comparison_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ComparisonTypesController, "handling GET /comparison_types/1" do

  before do
    @comparison_type = mock_model(ComparisonType)
    ComparisonType.stub!(:find).and_return(@comparison_type)
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
  
  it "should find the comparison_type requested" do
    ComparisonType.should_receive(:find).with("1").and_return(@comparison_type)
    do_get
  end
  
  it "should assign the found comparison_type for the view" do
    do_get
    assigns[:comparison_type].should equal(@comparison_type)
  end
end

describe ComparisonTypesController, "handling GET /comparison_types/1.xml" do

  before do
    @comparison_type = mock_model(ComparisonType, :to_xml => "XML")
    ComparisonType.stub!(:find).and_return(@comparison_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the comparison_type requested" do
    ComparisonType.should_receive(:find).with("1").and_return(@comparison_type)
    do_get
  end
  
  it "should render the found comparison_type as xml" do
    @comparison_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe ComparisonTypesController, "handling GET /comparison_types/new" do

  before do
    @comparison_type = mock_model(ComparisonType)
    ComparisonType.stub!(:new).and_return(@comparison_type)
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
  
  it "should create an new comparison_type" do
    ComparisonType.should_receive(:new).and_return(@comparison_type)
    do_get
  end
  
  it "should not save the new comparison_type" do
    @comparison_type.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new comparison_type for the view" do
    do_get
    assigns[:comparison_type].should equal(@comparison_type)
  end
end

describe ComparisonTypesController, "handling GET /comparison_types/1/edit" do

  before do
    @comparison_type = mock_model(ComparisonType)
    ComparisonType.stub!(:find).and_return(@comparison_type)
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
  
  it "should find the comparison_type requested" do
    ComparisonType.should_receive(:find).and_return(@comparison_type)
    do_get
  end
  
  it "should assign the found ComparisonType for the view" do
    do_get
    assigns[:comparison_type].should equal(@comparison_type)
  end
end

describe ComparisonTypesController, "handling POST /comparison_types" do

  before do
    @comparison_type = mock_model(ComparisonType, :to_param => "1")
    ComparisonType.stub!(:new).and_return(@comparison_type)
  end
  
  def post_with_successful_save
    @comparison_type.should_receive(:save).and_return(true)
    post :create, :comparison_type => {}
  end
  
  def post_with_failed_save
    @comparison_type.should_receive(:save).and_return(false)
    post :create, :comparison_type => {}
  end
  
  it "should create a new comparison_type" do
    ComparisonType.should_receive(:new).with({}).and_return(@comparison_type)
    post_with_successful_save
  end

  it "should redirect to the new comparison_type on successful save" do
    post_with_successful_save
    response.should redirect_to(comparison_type_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe ComparisonTypesController, "handling PUT /comparison_types/1" do

  before do
    @comparison_type = mock_model(ComparisonType, :to_param => "1")
    ComparisonType.stub!(:find).and_return(@comparison_type)
  end
  
  def put_with_successful_update
    @comparison_type.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @comparison_type.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the comparison_type requested" do
    ComparisonType.should_receive(:find).with("1").and_return(@comparison_type)
    put_with_successful_update
  end

  it "should update the found comparison_type" do
    put_with_successful_update
    assigns(:comparison_type).should equal(@comparison_type)
  end

  it "should assign the found comparison_type for the view" do
    put_with_successful_update
    assigns(:comparison_type).should equal(@comparison_type)
  end

  it "should redirect to the comparison_type on successful update" do
    put_with_successful_update
    response.should redirect_to(comparison_type_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe ComparisonTypesController, "handling DELETE /comparison_types/1" do

  before do
    @comparison_type = mock_model(ComparisonType, :destroy => true)
    ComparisonType.stub!(:find).and_return(@comparison_type)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the comparison_type requested" do
    ComparisonType.should_receive(:find).with("1").and_return(@comparison_type)
    do_delete
  end
  
  it "should call destroy on the found comparison_type" do
    @comparison_type.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the comparison_types list" do
    do_delete
    response.should redirect_to(comparison_types_url)
  end
end

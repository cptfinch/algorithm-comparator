require File.dirname(__FILE__) + '/../spec_helper'

describe BeamsController, "#route_for" do

  it "should map { :controller => 'beams', :action => 'index' } to /beams" do
    route_for(:controller => "beams", :action => "index").should == "/beams"
  end
  
  it "should map { :controller => 'beams', :action => 'new' } to /beams/new" do
    route_for(:controller => "beams", :action => "new").should == "/beams/new"
  end
  
  it "should map { :controller => 'beams', :action => 'show', :id => 1 } to /beams/1" do
    route_for(:controller => "beams", :action => "show", :id => 1).should == "/beams/1"
  end
  
  it "should map { :controller => 'beams', :action => 'edit', :id => 1 } to /beams/1/edit" do
    route_for(:controller => "beams", :action => "edit", :id => 1).should == "/beams/1/edit"
  end
  
  it "should map { :controller => 'beams', :action => 'update', :id => 1} to /beams/1" do
    route_for(:controller => "beams", :action => "update", :id => 1).should == "/beams/1"
  end
  
  it "should map { :controller => 'beams', :action => 'destroy', :id => 1} to /beams/1" do
    route_for(:controller => "beams", :action => "destroy", :id => 1).should == "/beams/1"
  end
  
end

describe BeamsController, "#params_from" do

  it "should generate params { :controller => 'beams', action => 'index' } from GET /beams" do
    params_from(:get, "/beams").should == {:controller => "beams", :action => "index"}
  end
  
  it "should generate params { :controller => 'beams', action => 'new' } from GET /beams/new" do
    params_from(:get, "/beams/new").should == {:controller => "beams", :action => "new"}
  end
  
  it "should generate params { :controller => 'beams', action => 'create' } from POST /beams" do
    params_from(:post, "/beams").should == {:controller => "beams", :action => "create"}
  end
  
  it "should generate params { :controller => 'beams', action => 'show', id => '1' } from GET /beams/1" do
    params_from(:get, "/beams/1").should == {:controller => "beams", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'beams', action => 'edit', id => '1' } from GET /beams/1;edit" do
    params_from(:get, "/beams/1/edit").should == {:controller => "beams", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'beams', action => 'update', id => '1' } from PUT /beams/1" do
    params_from(:put, "/beams/1").should == {:controller => "beams", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'beams', action => 'destroy', id => '1' } from DELETE /beams/1" do
    params_from(:delete, "/beams/1").should == {:controller => "beams", :action => "destroy", :id => "1"}
  end
  
end

describe BeamsController, "handling GET /beams" do

  before do
    @beam = mock_model(Beam)
    Beam.stub!(:find).and_return([@beam])
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
  
  it "should find all beams" do
    Beam.should_receive(:find).with(:all).and_return([@beam])
    do_get
  end
  
  it "should assign the found beams for the view" do
    do_get
    assigns[:beams].should == [@beam]
  end
end

describe BeamsController, "handling GET /beams.xml" do

  before do
    @beam = mock_model(Beam, :to_xml => "XML")
    Beam.stub!(:find).and_return(@beam)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all beams" do
    Beam.should_receive(:find).with(:all).and_return([@beam])
    do_get
  end
  
  it "should render the found beams as xml" do
    @beam.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe BeamsController, "handling GET /beams/1" do

  before do
    @beam = mock_model(Beam)
    Beam.stub!(:find).and_return(@beam)
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
  
  it "should find the beam requested" do
    Beam.should_receive(:find).with("1").and_return(@beam)
    do_get
  end
  
  it "should assign the found beam for the view" do
    do_get
    assigns[:beam].should equal(@beam)
  end
end

describe BeamsController, "handling GET /beams/1.xml" do

  before do
    @beam = mock_model(Beam, :to_xml => "XML")
    Beam.stub!(:find).and_return(@beam)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the beam requested" do
    Beam.should_receive(:find).with("1").and_return(@beam)
    do_get
  end
  
  it "should render the found beam as xml" do
    @beam.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe BeamsController, "handling GET /beams/new" do

  before do
    @beam = mock_model(Beam)
    Beam.stub!(:new).and_return(@beam)
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
  
  it "should create an new beam" do
    Beam.should_receive(:new).and_return(@beam)
    do_get
  end
  
  it "should not save the new beam" do
    @beam.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new beam for the view" do
    do_get
    assigns[:beam].should equal(@beam)
  end
end

describe BeamsController, "handling GET /beams/1/edit" do

  before do
    @beam = mock_model(Beam)
    Beam.stub!(:find).and_return(@beam)
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
  
  it "should find the beam requested" do
    Beam.should_receive(:find).and_return(@beam)
    do_get
  end
  
  it "should assign the found Beam for the view" do
    do_get
    assigns[:beam].should equal(@beam)
  end
end

describe BeamsController, "handling POST /beams" do

  before do
    @beam = mock_model(Beam, :to_param => "1")
    Beam.stub!(:new).and_return(@beam)
  end
  
  def post_with_successful_save
    @beam.should_receive(:save).and_return(true)
    post :create, :beam => {}
  end
  
  def post_with_failed_save
    @beam.should_receive(:save).and_return(false)
    post :create, :beam => {}
  end
  
  it "should create a new beam" do
    Beam.should_receive(:new).with({}).and_return(@beam)
    post_with_successful_save
  end

  it "should redirect to the new beam on successful save" do
    post_with_successful_save
    response.should redirect_to(beam_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe BeamsController, "handling PUT /beams/1" do

  before do
    @beam = mock_model(Beam, :to_param => "1")
    Beam.stub!(:find).and_return(@beam)
  end
  
  def put_with_successful_update
    @beam.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @beam.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the beam requested" do
    Beam.should_receive(:find).with("1").and_return(@beam)
    put_with_successful_update
  end

  it "should update the found beam" do
    put_with_successful_update
    assigns(:beam).should equal(@beam)
  end

  it "should assign the found beam for the view" do
    put_with_successful_update
    assigns(:beam).should equal(@beam)
  end

  it "should redirect to the beam on successful update" do
    put_with_successful_update
    response.should redirect_to(beam_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe BeamsController, "handling DELETE /beams/1" do

  before do
    @beam = mock_model(Beam, :destroy => true)
    Beam.stub!(:find).and_return(@beam)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the beam requested" do
    Beam.should_receive(:find).with("1").and_return(@beam)
    do_delete
  end
  
  it "should call destroy on the found beam" do
    @beam.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the beams list" do
    do_delete
    response.should redirect_to(beams_url)
  end
end

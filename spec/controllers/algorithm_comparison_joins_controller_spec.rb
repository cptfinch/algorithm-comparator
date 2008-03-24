require File.dirname(__FILE__) + '/../spec_helper'

describe AlgorithmComparisonJoinsController, "#route_for" do

  it "should map { :controller => 'algorithm_comparison_joins', :action => 'index' } to /algorithm_comparison_joins" do
    route_for(:controller => "algorithm_comparison_joins", :action => "index").should == "/algorithm_comparison_joins"
  end
  
  it "should map { :controller => 'algorithm_comparison_joins', :action => 'new' } to /algorithm_comparison_joins/new" do
    route_for(:controller => "algorithm_comparison_joins", :action => "new").should == "/algorithm_comparison_joins/new"
  end
  
  it "should map { :controller => 'algorithm_comparison_joins', :action => 'show', :id => 1 } to /algorithm_comparison_joins/1" do
    route_for(:controller => "algorithm_comparison_joins", :action => "show", :id => 1).should == "/algorithm_comparison_joins/1"
  end
  
  it "should map { :controller => 'algorithm_comparison_joins', :action => 'edit', :id => 1 } to /algorithm_comparison_joins/1/edit" do
    route_for(:controller => "algorithm_comparison_joins", :action => "edit", :id => 1).should == "/algorithm_comparison_joins/1/edit"
  end
  
  it "should map { :controller => 'algorithm_comparison_joins', :action => 'update', :id => 1} to /algorithm_comparison_joins/1" do
    route_for(:controller => "algorithm_comparison_joins", :action => "update", :id => 1).should == "/algorithm_comparison_joins/1"
  end
  
  it "should map { :controller => 'algorithm_comparison_joins', :action => 'destroy', :id => 1} to /algorithm_comparison_joins/1" do
    route_for(:controller => "algorithm_comparison_joins", :action => "destroy", :id => 1).should == "/algorithm_comparison_joins/1"
  end
  
end

describe AlgorithmComparisonJoinsController, "#params_from" do

  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'index' } from GET /algorithm_comparison_joins" do
    params_from(:get, "/algorithm_comparison_joins").should == {:controller => "algorithm_comparison_joins", :action => "index"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'new' } from GET /algorithm_comparison_joins/new" do
    params_from(:get, "/algorithm_comparison_joins/new").should == {:controller => "algorithm_comparison_joins", :action => "new"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'create' } from POST /algorithm_comparison_joins" do
    params_from(:post, "/algorithm_comparison_joins").should == {:controller => "algorithm_comparison_joins", :action => "create"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'show', id => '1' } from GET /algorithm_comparison_joins/1" do
    params_from(:get, "/algorithm_comparison_joins/1").should == {:controller => "algorithm_comparison_joins", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'edit', id => '1' } from GET /algorithm_comparison_joins/1;edit" do
    params_from(:get, "/algorithm_comparison_joins/1/edit").should == {:controller => "algorithm_comparison_joins", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'update', id => '1' } from PUT /algorithm_comparison_joins/1" do
    params_from(:put, "/algorithm_comparison_joins/1").should == {:controller => "algorithm_comparison_joins", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'algorithm_comparison_joins', action => 'destroy', id => '1' } from DELETE /algorithm_comparison_joins/1" do
    params_from(:delete, "/algorithm_comparison_joins/1").should == {:controller => "algorithm_comparison_joins", :action => "destroy", :id => "1"}
  end
  
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    AlgorithmComparisonJoin.stub!(:find).and_return([@algorithm_comparison_join])
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
  
  it "should find all algorithm_comparison_joins" do
    AlgorithmComparisonJoin.should_receive(:find).with(:all).and_return([@algorithm_comparison_join])
    do_get
  end
  
  it "should assign the found algorithm_comparison_joins for the view" do
    do_get
    assigns[:algorithm_comparison_joins].should == [@algorithm_comparison_join]
  end
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins.xml" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin, :to_xml => "XML")
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all algorithm_comparison_joins" do
    AlgorithmComparisonJoin.should_receive(:find).with(:all).and_return([@algorithm_comparison_join])
    do_get
  end
  
  it "should render the found algorithm_comparison_joins as xml" do
    @algorithm_comparison_join.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins/1" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
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
  
  it "should find the algorithm_comparison_join requested" do
    AlgorithmComparisonJoin.should_receive(:find).with("1").and_return(@algorithm_comparison_join)
    do_get
  end
  
  it "should assign the found algorithm_comparison_join for the view" do
    do_get
    assigns[:algorithm_comparison_join].should equal(@algorithm_comparison_join)
  end
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins/1.xml" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin, :to_xml => "XML")
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the algorithm_comparison_join requested" do
    AlgorithmComparisonJoin.should_receive(:find).with("1").and_return(@algorithm_comparison_join)
    do_get
  end
  
  it "should render the found algorithm_comparison_join as xml" do
    @algorithm_comparison_join.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins/new" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    AlgorithmComparisonJoin.stub!(:new).and_return(@algorithm_comparison_join)
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
  
  it "should create an new algorithm_comparison_join" do
    AlgorithmComparisonJoin.should_receive(:new).and_return(@algorithm_comparison_join)
    do_get
  end
  
  it "should not save the new algorithm_comparison_join" do
    @algorithm_comparison_join.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new algorithm_comparison_join for the view" do
    do_get
    assigns[:algorithm_comparison_join].should equal(@algorithm_comparison_join)
  end
end

describe AlgorithmComparisonJoinsController, "handling GET /algorithm_comparison_joins/1/edit" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin)
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
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
  
  it "should find the algorithm_comparison_join requested" do
    AlgorithmComparisonJoin.should_receive(:find).and_return(@algorithm_comparison_join)
    do_get
  end
  
  it "should assign the found AlgorithmComparisonJoin for the view" do
    do_get
    assigns[:algorithm_comparison_join].should equal(@algorithm_comparison_join)
  end
end

describe AlgorithmComparisonJoinsController, "handling POST /algorithm_comparison_joins" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin, :to_param => "1")
    AlgorithmComparisonJoin.stub!(:new).and_return(@algorithm_comparison_join)
  end
  
  def post_with_successful_save
    @algorithm_comparison_join.should_receive(:save).and_return(true)
    post :create, :algorithm_comparison_join => {}
  end
  
  def post_with_failed_save
    @algorithm_comparison_join.should_receive(:save).and_return(false)
    post :create, :algorithm_comparison_join => {}
  end
  
  it "should create a new algorithm_comparison_join" do
    AlgorithmComparisonJoin.should_receive(:new).with({}).and_return(@algorithm_comparison_join)
    post_with_successful_save
  end

  it "should redirect to the new algorithm_comparison_join on successful save" do
    post_with_successful_save
    response.should redirect_to(algorithm_comparison_join_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe AlgorithmComparisonJoinsController, "handling PUT /algorithm_comparison_joins/1" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin, :to_param => "1")
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
  end
  
  def put_with_successful_update
    @algorithm_comparison_join.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @algorithm_comparison_join.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the algorithm_comparison_join requested" do
    AlgorithmComparisonJoin.should_receive(:find).with("1").and_return(@algorithm_comparison_join)
    put_with_successful_update
  end

  it "should update the found algorithm_comparison_join" do
    put_with_successful_update
    assigns(:algorithm_comparison_join).should equal(@algorithm_comparison_join)
  end

  it "should assign the found algorithm_comparison_join for the view" do
    put_with_successful_update
    assigns(:algorithm_comparison_join).should equal(@algorithm_comparison_join)
  end

  it "should redirect to the algorithm_comparison_join on successful update" do
    put_with_successful_update
    response.should redirect_to(algorithm_comparison_join_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe AlgorithmComparisonJoinsController, "handling DELETE /algorithm_comparison_joins/1" do

  before do
    @algorithm_comparison_join = mock_model(AlgorithmComparisonJoin, :destroy => true)
    AlgorithmComparisonJoin.stub!(:find).and_return(@algorithm_comparison_join)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the algorithm_comparison_join requested" do
    AlgorithmComparisonJoin.should_receive(:find).with("1").and_return(@algorithm_comparison_join)
    do_delete
  end
  
  it "should call destroy on the found algorithm_comparison_join" do
    @algorithm_comparison_join.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the algorithm_comparison_joins list" do
    do_delete
    response.should redirect_to(algorithm_comparison_joins_url)
  end
end

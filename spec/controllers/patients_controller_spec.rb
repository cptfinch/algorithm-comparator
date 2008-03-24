require File.dirname(__FILE__) + '/../spec_helper'

describe PatientsController, "#route_for" do

  it "should map { :controller => 'patients', :action => 'index' } to /patients" do
    route_for(:controller => "patients", :action => "index").should == "/patients"
  end
  
  it "should map { :controller => 'patients', :action => 'new' } to /patients/new" do
    route_for(:controller => "patients", :action => "new").should == "/patients/new"
  end
  
  it "should map { :controller => 'patients', :action => 'show', :id => 1 } to /patients/1" do
    route_for(:controller => "patients", :action => "show", :id => 1).should == "/patients/1"
  end
  
  it "should map { :controller => 'patients', :action => 'edit', :id => 1 } to /patients/1/edit" do
    route_for(:controller => "patients", :action => "edit", :id => 1).should == "/patients/1/edit"
  end
  
  it "should map { :controller => 'patients', :action => 'update', :id => 1} to /patients/1" do
    route_for(:controller => "patients", :action => "update", :id => 1).should == "/patients/1"
  end
  
  it "should map { :controller => 'patients', :action => 'destroy', :id => 1} to /patients/1" do
    route_for(:controller => "patients", :action => "destroy", :id => 1).should == "/patients/1"
  end
  
end

describe PatientsController, "#params_from" do

  it "should generate params { :controller => 'patients', action => 'index' } from GET /patients" do
    params_from(:get, "/patients").should == {:controller => "patients", :action => "index"}
  end
  
  it "should generate params { :controller => 'patients', action => 'new' } from GET /patients/new" do
    params_from(:get, "/patients/new").should == {:controller => "patients", :action => "new"}
  end
  
  it "should generate params { :controller => 'patients', action => 'create' } from POST /patients" do
    params_from(:post, "/patients").should == {:controller => "patients", :action => "create"}
  end
  
  it "should generate params { :controller => 'patients', action => 'show', id => '1' } from GET /patients/1" do
    params_from(:get, "/patients/1").should == {:controller => "patients", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'patients', action => 'edit', id => '1' } from GET /patients/1;edit" do
    params_from(:get, "/patients/1/edit").should == {:controller => "patients", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'patients', action => 'update', id => '1' } from PUT /patients/1" do
    params_from(:put, "/patients/1").should == {:controller => "patients", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'patients', action => 'destroy', id => '1' } from DELETE /patients/1" do
    params_from(:delete, "/patients/1").should == {:controller => "patients", :action => "destroy", :id => "1"}
  end
  
end

describe PatientsController, "handling GET /patients" do

  before do
    @patient = mock_model(Patient)
    Patient.stub!(:find).and_return([@patient])
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
  
  it "should find all patients" do
    Patient.should_receive(:find).with(:all).and_return([@patient])
    do_get
  end
  
  it "should assign the found patients for the view" do
    do_get
    assigns[:patients].should == [@patient]
  end
end

describe PatientsController, "handling GET /patients.xml" do

  before do
    @patient = mock_model(Patient, :to_xml => "XML")
    Patient.stub!(:find).and_return(@patient)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all patients" do
    Patient.should_receive(:find).with(:all).and_return([@patient])
    do_get
  end
  
  it "should render the found patients as xml" do
    @patient.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PatientsController, "handling GET /patients/1" do

  before do
    @patient = mock_model(Patient)
    Patient.stub!(:find).and_return(@patient)
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
  
  it "should find the patient requested" do
    Patient.should_receive(:find).with("1").and_return(@patient)
    do_get
  end
  
  it "should assign the found patient for the view" do
    do_get
    assigns[:patient].should equal(@patient)
  end
end

describe PatientsController, "handling GET /patients/1.xml" do

  before do
    @patient = mock_model(Patient, :to_xml => "XML")
    Patient.stub!(:find).and_return(@patient)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the patient requested" do
    Patient.should_receive(:find).with("1").and_return(@patient)
    do_get
  end
  
  it "should render the found patient as xml" do
    @patient.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe PatientsController, "handling GET /patients/new" do

  before do
    @patient = mock_model(Patient)
    Patient.stub!(:new).and_return(@patient)
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
  
  it "should create an new patient" do
    Patient.should_receive(:new).and_return(@patient)
    do_get
  end
  
  it "should not save the new patient" do
    @patient.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new patient for the view" do
    do_get
    assigns[:patient].should equal(@patient)
  end
end

describe PatientsController, "handling GET /patients/1/edit" do

  before do
    @patient = mock_model(Patient)
    Patient.stub!(:find).and_return(@patient)
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
  
  it "should find the patient requested" do
    Patient.should_receive(:find).and_return(@patient)
    do_get
  end
  
  it "should assign the found Patient for the view" do
    do_get
    assigns[:patient].should equal(@patient)
  end
end

describe PatientsController, "handling POST /patients" do

  before do
    @patient = mock_model(Patient, :to_param => "1")
    Patient.stub!(:new).and_return(@patient)
  end
  
  def post_with_successful_save
    @patient.should_receive(:save).and_return(true)
    post :create, :patient => {}
  end
  
  def post_with_failed_save
    @patient.should_receive(:save).and_return(false)
    post :create, :patient => {}
  end
  
  it "should create a new patient" do
    Patient.should_receive(:new).with({}).and_return(@patient)
    post_with_successful_save
  end

  it "should redirect to the new patient on successful save" do
    post_with_successful_save
    response.should redirect_to(patient_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe PatientsController, "handling PUT /patients/1" do

  before do
    @patient = mock_model(Patient, :to_param => "1")
    Patient.stub!(:find).and_return(@patient)
  end
  
  def put_with_successful_update
    @patient.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @patient.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the patient requested" do
    Patient.should_receive(:find).with("1").and_return(@patient)
    put_with_successful_update
  end

  it "should update the found patient" do
    put_with_successful_update
    assigns(:patient).should equal(@patient)
  end

  it "should assign the found patient for the view" do
    put_with_successful_update
    assigns(:patient).should equal(@patient)
  end

  it "should redirect to the patient on successful update" do
    put_with_successful_update
    response.should redirect_to(patient_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe PatientsController, "handling DELETE /patients/1" do

  before do
    @patient = mock_model(Patient, :destroy => true)
    Patient.stub!(:find).and_return(@patient)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the patient requested" do
    Patient.should_receive(:find).with("1").and_return(@patient)
    do_delete
  end
  
  it "should call destroy on the found patient" do
    @patient.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the patients list" do
    do_delete
    response.should redirect_to(patients_url)
  end
end

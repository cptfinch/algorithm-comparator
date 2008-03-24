require File.dirname(__FILE__) + '/../../spec_helper'

describe "/patients/show.html.erb" do
  include PatientsHelper
  
  before do
    @patient = mock_model(Patient)
    @patient.stub!(:name).and_return("MyString")
    @patient.stub!(:id_number).and_return("MyString")

    assigns[:patient] = @patient
  end

  it "should render attributes in <p>" do
    render "/patients/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end


require File.dirname(__FILE__) + '/../../spec_helper'

describe "/patients/new.html.erb" do
  include PatientsHelper
  
  before do
    @patient = mock_model(Patient)
    @patient.stub!(:new_record?).and_return(true)
    @patient.stub!(:name).and_return("MyString")
    @patient.stub!(:id_number).and_return("MyString")
    assigns[:patient] = @patient
  end

  it "should render new form" do
    render "/patients/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", patients_path) do
      with_tag("input#patient_name[name=?]", "patient[name]")
      with_tag("input#patient_id_number[name=?]", "patient[id_number]")
    end
  end
end



require File.dirname(__FILE__) + '/../../spec_helper'

describe "/patients/index.html.erb" do
  include PatientsHelper
  
  before do
    patient_98 = mock_model(Patient)
    patient_98.should_receive(:name).and_return("MyString")
    patient_98.should_receive(:id_number).and_return("MyString")
    patient_99 = mock_model(Patient)
    patient_99.should_receive(:name).and_return("MyString")
    patient_99.should_receive(:id_number).and_return("MyString")

    assigns[:patients] = [patient_98, patient_99]
  end

  it "should render list of patients" do
    render "/patients/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end


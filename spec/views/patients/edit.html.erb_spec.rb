require File.dirname(__FILE__) + '/../../spec_helper'

describe "/patients/edit.html.erb" do
  include PatientsHelper
  
  before do
    @patient = mock_model(Patient)
    @patient.stub!(:name).and_return("MyString")
    @patient.stub!(:id_number).and_return("MyString")
    assigns[:patient] = @patient
  end

  it "should render edit form" do
    render "/patients/edit.html.erb"
    
    response.should have_tag("form[action=#{patient_path(@patient)}][method=post]") do
      with_tag('input#patient_name[name=?]', "patient[name]")
      with_tag('input#patient_id_number[name=?]', "patient[id_number]")
    end
  end
end



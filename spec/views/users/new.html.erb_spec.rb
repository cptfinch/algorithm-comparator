require File.dirname(__FILE__) + '/../../spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper
  
  before do
    @user = mock_model(User)
    @user.stub!(:new_record?).and_return(true)
    @user.stub!(:name).and_return("MyString")
    assigns[:user] = @user
  end

  it "should render new form" do
    render "/users/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", users_path) do
      with_tag("input#user_name[name=?]", "user[name]")
    end
  end
end



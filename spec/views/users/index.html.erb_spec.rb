require File.dirname(__FILE__) + '/../../spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper
  
  before do
    user_98 = mock_model(User)
    user_98.should_receive(:name).and_return("MyString")
    user_99 = mock_model(User)
    user_99.should_receive(:name).and_return("MyString")

    assigns[:users] = [user_98, user_99]
  end

  it "should render list of users" do
    render "/users/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end


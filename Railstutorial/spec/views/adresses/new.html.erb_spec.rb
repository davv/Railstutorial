require 'spec_helper'

describe "adresses/new.html.erb" do
  before(:each) do
    assign(:adress, stub_model(Adress,
      :adress => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new adress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => adresses_path, :method => "post" do
      assert_select "input#adress_adress", :name => "adress[adress]"
      assert_select "input#adress_user_id", :name => "adress[user_id]"
    end
  end
end

require 'spec_helper'

describe "adresses/edit.html.erb" do
  before(:each) do
    @adress = assign(:adress, stub_model(Adress,
      :adress => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit adress form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => adress_path(@adress), :method => "post" do
      assert_select "input#adress_adress", :name => "adress[adress]"
      assert_select "input#adress_user_id", :name => "adress[user_id]"
    end
  end
end

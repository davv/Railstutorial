require 'spec_helper'

describe "adresses/show.html.erb" do
  before(:each) do
    @adress = assign(:adress, stub_model(Adress,
      :adress => "Adress",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Adress/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end

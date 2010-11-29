require 'spec_helper'

describe "authors/index.html.erb" do
  before(:each) do
    assign(:authors, [
      stub_model(Author,
        :name => "Name",
        :age => 1
      ),
      stub_model(Author,
        :name => "Name",
        :age => 1
      )
    ])
  end

  it "renders a list of authors" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end

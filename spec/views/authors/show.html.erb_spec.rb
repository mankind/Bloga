require 'spec_helper'

describe "authors/show.html.erb" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :name => "Name",
      :age => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain(1.to_s)
  end
end

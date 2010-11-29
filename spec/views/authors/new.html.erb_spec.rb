require 'spec_helper'

describe "authors/new.html.erb" do
  before(:each) do
    assign(:author, stub_model(Author,
      :new_record? => true,
      :name => "MyString",
      :age => 1
    ))
  end

  it "renders new author form" do
    render

    rendered.should have_selector("form", :action => authors_path, :method => "post") do |form|
      form.should have_selector("input#author_name", :name => "author[name]")
      form.should have_selector("input#author_age", :name => "author[age]")
    end
  end
end

require 'spec_helper'

describe "authors/edit.html.erb" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :new_record? => false,
      :name => "MyString",
      :age => 1
    ))
  end

  it "renders the edit author form" do
    render

    rendered.should have_selector("form", :action => author_path(@author), :method => "post") do |form|
      form.should have_selector("input#author_name", :name => "author[name]")
      form.should have_selector("input#author_age", :name => "author[age]")
    end
  end
end

require 'rails_helper'

RSpec.describe "blogs/edit", type: :view do
  let(:blog) {
    Blog.create!(
      title: "MyString",
      body: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:blog, blog)
  end

  it "renders the edit blog form" do
    render

    assert_select "form[action=?][method=?]", blog_path(blog), "post" do

      assert_select "input[name=?]", "blog[title]"

      assert_select "textarea[name=?]", "blog[body]"

      assert_select "input[name=?]", "blog[user_id]"
    end
  end
end

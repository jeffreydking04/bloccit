require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

  describe "attributes" do
    it "should have title and body attributes" do
      expect(post).not_to be_nil
    end

    it "should have designatedtitle and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
end

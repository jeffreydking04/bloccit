require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it "should have a body attribute" do
      expect(comment).not_to be_nil
    end
    
    it "should have designated body attribute" do
      expect(comment).to have_attributes(body: "Comment Body")
    end
  end
end

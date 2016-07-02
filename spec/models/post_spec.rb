require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "NewPost Body") }
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:topic) { Topic.create!(name: name, description: description) }
  let(:post) { topic.posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }  

  describe "attributes" do
    it "should have title and body attributes" do
      expect(post).not_to be_nil
    end

    it "should have designatedtitle and body attributes" do
      expect(post).to have_attributes(title: title, body: body)
    end
  end
end

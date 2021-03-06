require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:name) {RandomData.random_sentence}
  let(:description) {RandomData.random_paragraph}
  let(:public) { true }
  let(:topic) { Topic.create!(name: name, description: description) }

  it { is_expected.to have_many(:posts) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_length_of(:name).is_at_least(5) }
  it { is_expected.to validate_length_of(:description).is_at_least(15) }

  describe "attributes" do
    it "should not be nil" do
      expect(topic).not_to be_nil
    end

    it "should have designated attributes" do
      expect(topic).to have_attributes(name: name, description: description, public: public)
    end

    it "should be public: true by default" do
      expect(topic.public).to be(true)
    end
  end
end

require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }

  it "should not be nil" do
    expect(question).not_to be_nil
  end

  it "should have designated attributes" do
    expect(question).to have_attributes(title: "New Question Title", body: "New Question Body", resolved: false)
  end
end

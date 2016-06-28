require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Advertisement Title", body: "New Advertisement Body", price: 1) }

  describe "atttributes" do
    it "should not be nil" do
      expect(advertisement).not_to be_nil
    end

    it "should have designated attributes" do
      expect(advertisement).to have_attributes(title: "New Advertisement Title", body: "New Advertisement Body", price: 1)
    end
  end
end

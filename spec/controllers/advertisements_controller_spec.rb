require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:my_advertisement) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(10..100)) }

  describe "GET #index" do
    it "should return http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should render the #index view" do
      get :index
      expect(response).to render_template(:index)
    end

    it "should assign [my_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_advertisement])
    end
  end

  describe "GET #show" do
    it "should return http success" do
      get :show, {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "should render the #show template" do
      get :show, {id: my_advertisement.id}
      expect(response).to render_template(:show)
    end

    it "should assign my_advertisement to @advertisement" do
      get :show, {id: my_advertisement.id}
      expect(assigns(:advertisement)).to eq(my_advertisement)
    end
  end

  describe "GET #new" do
    it "should return http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should render the #new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "should instantiate @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "should increase the number of Advertisement by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(10..100)}}.to change(Advertisement,:count).by(1)
    end

    it "should assign the new advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(10..100)}
      expect(assigns(:advertisement)).to eq(Advertisement.last)
    end

    it "should redirect to the new advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(10..100)}      
      expect(response).to redirect_to(Advertisement.last)
    end
  end
end

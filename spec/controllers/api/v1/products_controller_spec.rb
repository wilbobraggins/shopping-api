require "rails_helper"

RSpec.describe Api::V1::ProductsController, type: :controller do
  let(:valid_attributes) do
    {
      item:        "Ornament",
      description: "This is a description for ornaments and a test",
      price:        4.50
    }
  end

  let(:invalid_attributes) do
    { price: nil }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = create(:product)
      get :show, params: { id: product.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect do
          post :create, params: { product: valid_attributes }
        end.to change(Product, :count).by(1)
      end

      it "returns a 201 status code" do

        post :create, params: { product: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "does not create a new Product" do
        expect do
          post :create, params: { product: invalid_attributes }
        end.to change(Movie, :count).by(0)
      end

      it "returns a 422 status code" do

        post :create, params: { product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
  
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        {
          item: "Pie",
          description: "this new description is valid",
        }
      end

      it "updates the requested product" do
        product = create(:product)
        put :update, params: { id: product.to_param, product: new_attributes }
        movie.reload
        expect(product.attributes).to include("item" => "Pie")
      end

      it "returns a 200 status code" do
        product = create(:product)

        put :update, params: { id: product.to_param, product: valid_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "returns a 422 status code" do
        movie = create(:product)

        put :update, params: { id: product.to_param, product: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = create(:product)
      expect do
        delete :destroy, params: { id: product.to_param }
      end.to change(Product, :count).by(-1)
    end
  end

end
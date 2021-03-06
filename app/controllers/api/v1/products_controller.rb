class Api::V1::ProductsController < Api::V1::ApiController
  before_action :set_product, only: %i[show update destroy]
  
  def index

    render json: serializer.new(Product.all)
  end

  def show
    render json: serializer.new(Product.find(params[:id]))
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end
  
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def serializer
    ProductSerializer
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:item, :description, :price)
  end
end
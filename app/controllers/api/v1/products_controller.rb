class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  # GET /product
  def index
   @product = Product.all
   render json: @product
  end
  # GET /product/1
  def show
   render json: @product
  end
  # POST /product
  def create
   @product = Product.new(product_params)
   if @product.save
    render json: @product, status: :created, location:        api_v1_product_url(@product)
   else
    render json: @product.errors, status: :unprocessable_entity
   end
  end
  # PATCH/PUT /product/1
  def update
   if @product.update(product_params)
    render json: @product
   else
    render json: @product.errors, status: :unprocessable_entity
   end
  end
 # DELETE /product/1
  def destroy
   @product.destroy
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
   @product = Product.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :content, :price, :image)
    end
end

class CartsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @carts = Cart.where(user_id: session[:user_id])
    # @product = Product.find(params[:product_id])

    # @carts = Cart.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def new
    # @products = Product.all
    @cart = Cart.new
    @product = Product.find(params[:product_id])
  end

  def create
    @cart = Cart.new(cart_params)
    @product = Product.find(params[:product_id])

    respond_to do |format|
      if @cart.save
        # format.html { redirect_to @cart, notice: 'Review was successfully created.' }
        # format.json { render :show, status: :created, location: @cart }
        # format.html { redirect_to product_carts_path, notice: 'Item was successfully added to cart.' }
        format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item was successfully added to cart.' }
        format.json { render :show, status: :created, location: product_carts_path }
      else
        format.html { render :new }
        format.json { render json: product_carts_path.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @review = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      # params.fetch(:review, {})
      params.require(:cart).permit(:quantity, :user_id, :product_id)
    end

end

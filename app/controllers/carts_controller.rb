class CartsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

    # GET /products
    # GET /products.json
    def index
      @carts = Cart.where(user_id: session[:user_id])

    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    def new
      @cart = Cart.new
      @product = Product.find(params[:product_id])
    end

    def edit
      @cart = Cart.find( params[:id])

    end

    def create
      @cart = Cart.new(cart_params)
      @product = Product.find(params[:product_id])

      respond_to do |format|
        if @cart.save
          format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item was successfully added to cart.' }
          format.json { render :show, status: :created, location: product_carts_path }
        else
          format.html { render :new }
          format.json { render json: product_carts_path.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @cart = Cart.find( params[:id])
      respond_to do |format|
        if @cart.update(cart_params)
          format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item in cart was successfully updated.' }
          format.json { render :show, status: :ok, location: user_carts_path(session[:user_id]) }
        else
          format.html { render :edit }
          format.json { render json: product_carts_path.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @cart = Cart.find( params[:id])
      @cart.destroy
      respond_to do |format|
        format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item in cart was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cart
        @cart = Cart.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cart_params
        # params.fetch(:review, {})
        params.require(:cart).permit(:quantity, :user_id, :product_id)
      end

      def set_product
        @product = Product.find(params[:id])
      end

end

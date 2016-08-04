class CartsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login,   only: [:show, :edit, :update, :index]
  before_action :correct_user,   only: [:show]

    # GET /products
    # GET /products.json
    def index
      if admin_user?(@check)
        @carts = Cart.all.sort
      else
        @carts = Cart.where(user_id: session[:user_id]).sort
      end
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
      @product = Product.find_by_id(@cart.product_id)
    end

    def create
      @cart = Cart.new(cart_params)
      @prod = Product.find(params[:product_id])

      @found = false
      @cart_all = Cart.all
      @cart_all.each do |cart|
        unless cart.user.id != session[:user_id]
          if cart.product_id == @prod.id
            @found = true
          end
        end
      end

    if !@found
      respond_to do |format|
        if @cart.save
          format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item was successfully added to cart.' }
          format.json { render :show, status: :created, location: product_carts_path }
        else
          format.html { render :new }
          format.json { render json: product_carts_path.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:danger] = 'Duplicate product found in cart'
      redirect_to product_carts_path
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
      if @cart.destroy
      respond_to do |format|
        format.html { redirect_to user_carts_path(session[:user_id]), notice: 'Item in cart was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cart
        @cart = Cart.find(params[:id])
      end

      def require_login
        # @user = User.find(params[:id])
        unless logged_in?
          # unless !(set_user.new_record?)
          flash[:danger] = 'Not allowed before login'
          redirect_to root_url
        # end
      end
      end

      def correct_user

        if logged_in?
        @user = User.find(params[:id])

        unless admin_user?(@check)
        unless current_user?(@user)
          flash[:warning] = 'You are not allowed to access'
          # redirect_to root_url
          redirect_to root_url
        end
        end
      end
    end

      # Never trust parameters from the scary internet, only allow the white list through.
      def cart_params
        # params.fetch(:review, {})
        params.require(:cart).permit(:quantity, :user_id, :product_id)
      end

      def set_product
        @c = Cart.find( params[:id])
        @product_id = @c.product_id
      end

end

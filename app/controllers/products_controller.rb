class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :require_login,   only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update, :destroy, :show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.sort
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
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
    def product_params
      # params.fetch(:product, {})
      params.require(:product).permit(:name, :brand_id, :category_id, :price)
    end
end

class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_login,   only: [:show, :edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all.sort
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
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
    def review_params
      # params.fetch(:review, {})
      params.require(:review).permit(:content, :user_id, :product_id)
    end
end

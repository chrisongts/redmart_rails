class UsersController < ApplicationController

  before_action :set_user,        only: [:show, :edit, :update, :destroy]
  before_action :require_login,   only: [:show, :edit, :update, :index]
  # before_action :correct_user,    only: [:show, :edit, :update, :destroy]
  # before_action :correct_user,    except: [:index, :new, :show, :create]
  before_action :correct_user,   only: [:edit, :update, :destroy, :show]
  before_action :require_logout,  only: [:new]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find( params[:id] )
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(user_params)
    @user = User.new( permitted_user_params )

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def require_login
      unless logged_in?
        flash[:danger] = 'Not allowed before login'
        redirect_to root_url
      end
    end

    def correct_user

      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:warning] = 'You are not allowed to access'
        # redirect_to root_url
        redirect_to help_url
      end

    end

    def require_logout
      if logged_in?
        flash[:warning] = 'You must logged out to create a new user'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

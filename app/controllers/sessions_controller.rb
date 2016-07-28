class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by(email: params[:session][:email].downcase)
    #  debugger
    # if user is found
    if user && user.authenticate( params[:session][:password] )
      # not rendering
      flash[:success] = 'Login successfully!'
      log_in(user)
      # session[:user_id] = user.id
      redirect_to user
    else
      # show error notice
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    # add flash after log out
    flash[:info] = 'You have logged out. Thank you!'
    redirect_to root_url
  end

end

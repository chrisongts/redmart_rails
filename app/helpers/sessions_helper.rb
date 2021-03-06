module SessionsHelper

  # Set session with authentiocated user
    def log_in(user)
      session[:user_id] = user.id
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def current_user?(user)
      user == current_user
    end

    def logged_in?
      current_user
    end

    # Logs out the current user.
   def log_out
     session.delete(:user_id)
     @current_user = nil
   end

   def admin_user?(check)
     if logged_in?
     check = current_user.admin
   end
   end

  end

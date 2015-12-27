class SessionsController < ApplicationController
  skip_before_filter :ensure_login, only: [:new, :create]
  
  def new
  end

  def create
  #user = sessions.new(sessions_params)
  user = User.find_by(username: params[:user][:username])
  password = params[:user][:password]
  
   if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully' 
	else
	# format.html { redirect_to login_path}
	 redirect_to login_path
   end
   
  end

  def destroy
  reset_session #wipe out session and everything in it
  redirect_to login_path, notice: "logout successful"
  end
end

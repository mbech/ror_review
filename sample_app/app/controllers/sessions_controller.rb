class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log the user in then redirect
      log_in user
      redirect_to user
    else
      #create an error message
      flash.now[:danger] = 'Invaild email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end

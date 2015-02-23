class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:email])
      #log the user in then redirect
    else
      #create an error message
      flash.now[:danger] = 'Invaild email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end

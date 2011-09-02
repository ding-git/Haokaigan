class SessionsController < ApplicationController

  def index
    redirect_to '/'
  end

  def new
    redirect_to current_user if signed_in?    
    @title = "Sign in"    
  end
  
  def create
    if params[:session][:email] =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    user = User.authenticate_email(params[:session][:email],
                             params[:session][:password])
    else                         
    user = User.authenticate_name(params[:session][:email],
                               params[:session][:password])
    end
    
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or :back
    end
  end
  
  def destroy
    sign_out
    redirect_to :back
  end
end
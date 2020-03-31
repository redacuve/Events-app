class SessionsController < ApplicationController
  def index; end

  def new
    
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      login(@user)
      flash[:success] = 'Welcome to our App'
      redirect_to @user
    else
      flash[:danger] = 'User not found'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end

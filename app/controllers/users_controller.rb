class UsersController < ApplicationController
  # before_action :set_user, only: [:show]
  before_action :logged_in_user, only: [:show]
  def index; end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User Registered'
      redirect_to @user
    else
      render :new
    end
  end

  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Log In'
      redirect_to login_url
    end
  end
end

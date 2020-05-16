module SessionsHelper
  def login(user)
    session[:current_user] = user.id
  end

  def logout
    session.delete(:current_user)
    @current_user = nil
  end

  def current_user
    if session[:current_user]
      @current_user ||= User.find(session[:current_user]) unless session[:current_user].nil?
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please Log In'
      redirect_to login_url
    end
  end
end

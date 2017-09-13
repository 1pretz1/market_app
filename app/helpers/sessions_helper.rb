module SessionsHelper

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user?
    unless logged_in?
      flash[:danger] = 'Need to login to access this feature!'
      redirect_to '/login'
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def admin
    if current_user.admin?
    end
  end
end

module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    @current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def get_current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !get_current_user.nil?
  end

  def current_user?(user)
    user == get_current_user
  end

  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
 
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end

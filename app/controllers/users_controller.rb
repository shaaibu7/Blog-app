class UsersController < ActionController::Base
  def index
    @users = User.all
  end

  def show
    if params[:id] = 'sign out'
      sign_out_and_redirect
    else
      find_user
    end
  end

  private

  def sign_out_and_redirect
    sign_out current_user
    redirect_to new_user_session_path
  end

  def find_user
    @user = User.find_by(id: params[:id])
    redirect_to user_path, alert: 'User is not available' unless @user
  end
end

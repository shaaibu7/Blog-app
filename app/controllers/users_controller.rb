class UsersController < ActionController::Base
  before_action :authenticate_user!
  
  def index
    @users = User.all
    # @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
end

class Admin::UsersController < ApplicationController

  before_filter :authorize_user

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    head :no_content
  end

  protected

  def authorize_user
    unless current_user.admin?
      flash[:notice] = "You need to be an admin to access that page"
      redirect_to root_path
    end
  end

end

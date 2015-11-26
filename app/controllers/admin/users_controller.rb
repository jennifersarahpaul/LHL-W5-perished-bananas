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
    # redirect to blah if user not admin
  end

end

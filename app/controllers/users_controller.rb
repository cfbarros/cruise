class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    # @rent or @bike
    authorize @user
  end

  def edit
    @user = authorize User.find(params[:id])
  end

  def update
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address)
end

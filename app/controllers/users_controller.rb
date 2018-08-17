class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    # @rent or @bike
    authorize @user
  end
end

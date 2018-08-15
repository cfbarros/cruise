class RentsController < ApplicationController

def new
  @rent = Rent.new
end

def create
  @bike = Bike.find(params[:bike_id])
  @rent = Rent.new(rent_params)
  @rent.bike = @bike
  @rent.user = current_user
  skip_authorization
  if @rent.save
    redirect_to rent_path(@rent)
  else
    render "bikes/show"
  end
end

def show
  @user = current_user
  @rent = @user.rents
  authorize @rent
end

private

def rent_params
  params.require(:rent).permit(:user_id, :bike_id, :start_date, :end_date)
end

end

class RentsController < ApplicationController

def new
  @rent = Rent.new
end

def create
  @bike = Bike.find(params[:bike_id])
  @rent = Rent.new(rent_params)
  @rent.bike = @bike
  if @rent.save
    redirect_to rent_path(@rent)
  else
    render :new
  end
end

def show
  @user = current_user
  @rent = Rent.find(params[:id])
  authorize @rent
end

private

def rent_params
  params.require(:rent).permit(:user_id, :bike_id)
end

end

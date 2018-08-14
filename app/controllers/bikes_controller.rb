class BikesController < ApplicationController
  before_action :set_bike, only: [ :show, :edit, :update, :destroy ]

  def index
  @bikes = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if Bike.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bike = Bike.update(bike_params)
    if Bike.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy
    redirect_to user_path(@user)
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    param.require(:bikes).permit(:kind, :size, :location, :brand, :price)
  end

end

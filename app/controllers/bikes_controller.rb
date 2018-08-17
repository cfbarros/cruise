  class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [ :show, :edit, :update, :destroy ]

  def index

    if params[:query].present?
      @bikes = policy_scope(Bike.search_by_address(params[:query]))
    else
      @bikes = policy_scope(Bike).where.not(latitude: nil, longitude: nil)
    end

    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
        # infoWindow: { content: render_to_string(partial: "/bikes/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @bike = authorize(@bike)
    @rent = Rent.new
  end

  def new
    @bike = authorize(Bike.new)
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to user_path(@bike.user), notice: 'Bike was successfully added.'
    else
      render :new
    end
  end

  def edit
    authorize @bike
  end

  def update
    @bike.update(bike_params)
    authorize @bike
    if @bike.save
      redirect_to user_path(current_user), notice: 'Bike listing was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @bike
    @bike.destroy
    redirect_to user_path(current_user), notice: 'Bike listing was successfully destroyed :('
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:kind, :size, :address, :brand, :price, :photo)
  end

  def user_not_authorized(exception)
   policy_name = exception.policy.class.to_s.underscore

   flash[:error] = t "You must create a account to add a bike",  scope: "pundit"
   redirect_to new_user_registration
  end
end

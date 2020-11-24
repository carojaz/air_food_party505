class RentalsController < ApplicationController

  def show
    @user = current_user
    @rental = Rental.find(params[:id])
    if @rental.user_id == @user.id || Device.find(@rental.device_id).user_id == @user.id
    else
      render rentals_path, notice: "You are not allowed to enter this"
    end
  end

  def new
    @device = Device.find(params[:device_id])
    @rental = Rental.new
  end

  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @rental.user_id = @user.id
    @rental.device_id = params[:device_id]
    @rental.save
    redirect_to devices_path
    # @rental.device_id = @device.id
    # state = pending
  end

  def validated
    rental = Rental.find(params[:id])
    rental.update(state: "validated")
    redirect_to rental_path(rental)
  end

  def refused
    rental = Rental.find(params[:id])
    rental.update(state: "refused")
    redirect_to rental_path(rental)
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :state, :device_id)
  end
end

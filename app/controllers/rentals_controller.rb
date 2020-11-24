class RentalsController < ApplicationController

  def new
    @device = Device.find(params[:device_id])
    @rental = Rental.new
  end

  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @rental.user_id = @user.id
    @rental.device_id = params[:device_id]
    if @rental.save
      redirect_to account_rentals_path
    else
      redirect_to devices_path, notice: "No rental done. Please enter all details"
    end
    # @rental.device_id = @device.id
    # state = pending
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :state, :device_id)
  end
end

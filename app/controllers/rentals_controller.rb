class RentalsController < ApplicationController

  def index
    @user = current_user
    # afficher les rentals de mon user actuel :
    # 2 possibilites user de la rental ou user de la device
    # reservations qu'on a faite
    @rentals_done = Rental.where(user_id == @user.id)
    # reservation sur nos appareils
    @rentals_on_user_device = Rental.where(@rental.device_id.user_id == @user.id)
  end

  def show
    @user = current_user
    if @rental.user_id == @user.id || Device.find(@rental.device_id).user_id == @user.id
      @rental = Rental.find(params[:id])
    else
      render rentals_path, notice: "You are not allowed to enter this"
    end
  end

  def new
    @device = Device.find(params[:format])
    @rental = Rental.new
  end

  def create
    @user = current_user
    @rental = Rental.new(rental_params)
    @rental.user_id = @user.id
    @rental.device_id = params[:rental][:device_id]
    @rental.save
    redirect_to devices_path
    # @rental.device_id = @device.id
    # state = pending
  end

  def validated
    rental = Rental.find(params[:id])
    rental.update(state: "validate")
    redirect_to rentals_path
  end
  
  def refused
    rental = Rental.find(params[:id])
    rental.update(state: "refuse")
    redirect_to rentals_path
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :state)
  end
end

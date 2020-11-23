class RentalsController < ApplicationController

  def index
    @user = current.user
    # afficher les rentals de mon user actuel : 2 possibilites user de la rental ou user de la device

    if @user == current.user
      @rentals = Rental.where(user_id == @user.id)
    elsif Device.find(@rental.device_id).user_id == @user.id
      @rentals = Rental.where(@rental.device_id.user_id == @user.id)
    else
      render devices_path, "You are not allowed to enter this"
    end
  end

  def show
    @user = current.user
    if @rental.user_id == @user.id || Device.find(@rental.device_id).user_id == @user.id
      @rental = Rental.find(params[:id])
    else
      render rentals_path, notice: "You are not allowed to enter this"
    end
  end

  def new
    @device = Device.find(params[:id])
    @rental = Rental.new
  end

  def create
    @user = current.user
    @rental = Rental.new(rental_params)
    @rental.user_id = @user.id
    @rental.device_id = @device.id
    # state = pending
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :state)
  end
end

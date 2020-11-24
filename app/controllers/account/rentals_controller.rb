class Account::RentalsController < ApplicationController
  def index # a tester
    @user = current_user
    # afficher les rentals de mon user actuel :
    # 2 possibilites user de la rental ou user de la device
    # reservations qu'on a faite
    @rentals_done = Rental.where(user_id: @user.id)
    # reservation sur nos appareils
    @devices_of_the_user = Device.where(user_id: current_user.id)
    @rentals_on_user_device = Rental.where(device: @devices_of_the_user)
    # @devices_of_the_user.each do |device|
    #   @rentals_on_user_device << Rental.where(device_id: device.id)
    # end
  end

  # def show
  # @user = current_user
  # @rental = Rental.find(params[:id])
  #   if @rental.user_id == @user.id || Device.find(@rental.device_id).user_id == @user.id
  #   else
  #     render rentals_path, notice: "You are not allowed to enter this"
  #   end
  # end

  def validated
    rental = Rental.find(params[:id])
    rental.update(state: "validated")
    redirect_to account_rentals_path
  end

  def refused
    rental = Rental.find(params[:id])
    rental.update(state: "refused")
    redirect_to account_rentals_path
  end
end

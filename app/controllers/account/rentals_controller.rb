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
end

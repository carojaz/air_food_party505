class DevicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @devices = Device.all
  end

  def index_by_user
    @user = current.user
    @user.devices
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    @device.user_id = current.user_id
    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def edit
    # edit que les devices liees a son user_id
    @user = current.user
    @device = Device.find(params[:id])
    if @device.user_id == @user.id
      @device = Device.find(params[:id])
    else
      render :show, notice: "You can't change a device from an other user"
    end
  end

  def update
    @device = Device.find(params[:id])
    @device.update(device_params)
  end

  def destroy
    @user = current.user
    @device = Device.find(params[:id])
    if @device.user_id == @user.id
      @device.destroy
      redirect_to devices_path
    else
      render :index, notice: "You can't destroy a device from an other user"
    end
  end

  private

  def device_params
    params.require(:device).permit(:name, :description, :price, :pictures)
  end
end

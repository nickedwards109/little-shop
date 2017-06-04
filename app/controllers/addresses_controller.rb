class AddressesController < AuthenticateUserController
  before_action :set_address, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:new, :index, :create, :index, :edit]

  def new
    @address = Address.new
  end

  def create
    address = @user.addresses.create(address_params)

    if address
      redirect_to user_addresses_path, notice: 'Successfully Created Address'
    else
      flash[:notice] = 'Unable to Create Address'
      render :new
    end
  end

  def index
  end

  def edit
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to user_addresses_path, notice: 'Successfully Updated Address'
    else
      flash[:notice] = 'Unable to Update Address'
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_addresses_path, notice: 'Successfully Deleted Address'
  end

  private

  def address_params
    params.require(:address)
          .permit(:street_address, :street_address2, :city, :state, :zip_code)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
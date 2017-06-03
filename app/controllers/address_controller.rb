class AddressController < AuthenticateUserController
  before_action :set_address, only: [:edit, :update, :destroy]

  def new
    binding.pry
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create
    binding.pry
    @address = Address.new(address_params)

    if @address.save
      redirect_to user_address_index_path, notice: 'Successfully Created Address'
    else
      flash[:notice] = 'Unable to Create Address'
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    if @address.update_attributes(address_params)
      redirect_to user_address_index_path, notice: 'Successfully Updated Address'
    else
      flash[:notice] = 'Unable to Update Address'
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to user_address_index_path, notice: 'Successfully Deleted Address'
  end

  private

  def address_params
    params.require(:address)
          .permit(:street_address, :street_address2, :city, :state, :zip_code)
  end

  def set_address
    @address = Address.find(params[:id])
  end
end
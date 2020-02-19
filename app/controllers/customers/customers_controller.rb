class Customers::CustomersController < ApplicationController
  def edit
  	@customer = Customer.find(params[:id])
  end

  def favorites
  end

  def show
  	@customer = Customer.find(params[:id])
    @currentCustomerEntry = Entry.where(customer_id: current_customer.id)
    @customerEntry=Entry.where(customer_id: @customer.id)
    unless @customer.id == current_customer.id
      @currentCustomerEntry.each do |cu|
        @customerEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def index
  	@customers = Customer.all
  end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to edit_customers_customer_path(@customer)
  end

  def hide
  	@customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:artist,:profile_image,:genre,:live,:nickname)
  end
end

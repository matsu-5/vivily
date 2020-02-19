class Admin::CustomersController < ApplicationController
  def show
  end

  def index
  	@customer = Customer.all
  	@customer =Customer.page(params[:page]).per(10).order(created_at: "DESC")
  end
end

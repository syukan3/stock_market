class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    @contracts = Contract.where(user_id: current_user.id).order(stock_number: :asc)
    @buys = Buy.where(user_id: current_user.id)
    @sells =Sell.where(user_id: current_user.id)
  end


end

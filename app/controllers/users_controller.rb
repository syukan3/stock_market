class UsersController < ApplicationController

  def show
    @user = User.find_by(id: current_user.id)
    @hold_stocks = Order.where(user_id: current_user.id, status: "hold")
  end


end

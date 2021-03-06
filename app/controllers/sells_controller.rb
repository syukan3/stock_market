class SellsController < ApplicationController

  before_action :having_stock_check, {only: [:create]}
  after_action :transaction_check, {only: [:create]}

  def new
    @sell = Sell.new
    @issue = Issue.find_by(id: params[:issue_id])
  end

  def create
    @issue = Issue.find_by(params[:issue_id])
    @sell = Sell.new(price: params[:price], amount: params[:amount], user_id: current_user.id, issue_id: @issue.id)
    if @sell.save
      flash[:notice] ="注文しました。"
      redirect_to(user_path(current_user))
    else
      flash[:notice] ="注文できませんでした。"
      render("sells/new")
    end
  end

  def show
    @sell = Sell.find_by(id: params[:id])
  end

  def destroy
    @sell = Sell.find_by(id: params[:id])
    @sell.destroy
    flash[:notice] = "注文をキャンセルしました。"
    redirect_to(user_path(current_user))
  end

end

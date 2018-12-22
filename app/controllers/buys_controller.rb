class BuysController < ApplicationController

  before_action :available_check, {only: [:create]}
  after_action :transaction_check, {only: [:create]}

  def new
    @buy = Buy.new
    @issue = Issue.find_by(id: params[:issue_id])
  end

  def create
    @issue = Issue.find_by(params[:issue_id])
    @buy = Buy.new(price: params[:price], amount: params[:amount], user_id: current_user.id, issue_id: @issue.id)
    if @buy.save
      flash[:notice] ="注文しました。"
      redirect_to(user_path(current_user))
    else
      flash[:notice] ="注文できませんでした。"
      render("buys/new")
    end
  end

  # def show
  #   @buy = Buy.find_by(id: params[:id])
  # end

  def destroy
    @buy = Buy.find_by(id: params[:id])
    byebug
    @buy.destroy
    flash[:notice] = "注文をキャンセルしました。"
    redirect_to(user_path(current_user))
  end

end

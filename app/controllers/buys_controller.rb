class BuysController < ApplicationController

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
end

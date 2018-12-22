class IssuesController < ApplicationController

  def index
    @issues = Issue.search(params[:search])

  end

  def show
    @issue = Issue.find_by(id: params[:id])
    @stock_today = Stock.find_by(stock_number: @issue.stock_number, date: Date.today)
    @stock_yesterday = Stock.find_by(stock_number: @issue.stock_number, date: Date.today - 1)

    @buys = @issue.buys.where(issue_id: params[:id]).order(price: :desc).limit(5)

    sell_pre1 = @issue.sells.where(issue_id: params[:id]).order(price: :asc)
    sell_pre2 = sell_pre1.limit(5)
    @sells = sell_pre2.sort{|a, b| b <=> a }
  end


end

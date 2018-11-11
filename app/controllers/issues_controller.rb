class IssuesController < ApplicationController

  def index
    @issues = Issue.search(params[:search])

  end

  def show
    @issue = Issue.find_by(id: params[:id])
    # @buy = Buy.where(issue_id: params[:id]).order(price: :asc).limit(1)
    # @sell = Sell.where(issue_id: params[:id]).order(price: :asc).limit(5)
    # @posts = @room.posts.all
    @buys = @issue.buys.where(issue_id: params[:id]).order(price: :asc).limit(1)
    @sells = @issue.sells.all

    @buy_1 = "1"


    # if @issue.image.attached?
    #   return
    # else
    # # チャートが作成済みでなければ、gnuplotでチャートを作成
    #   Gnuplot.open do |gp|
    #     Gnuplot::SPlot.new(gp) do |plot|
    #       plot.terminal "png"
    #       plot.output   "1301.png"
    #       plot.set "isosamples 50,50"
    #       plot.set "pm3d at b"
    #       plot.data << Gnuplot::DataSet.new("sin(sqrt(x*x+y*y))/sqrt(x*x+y*y)")
    #     end
    #     gets
    #   end
    # # gnuplotで作成したチャートをActiveStorageに保存
    #   @issue.image.attached("1301.png")
    # end

  end


end

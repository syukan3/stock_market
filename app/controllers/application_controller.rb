class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def available_check
    @user = User.find_by(id: current_user.id)
    @buy = Buy.new(price: params[:price], amount: params[:amount])
    stock_price = @buy.price * @buy.amount
    if @user.available < stock_price
      flash[:notice] = "買付可能額が足りません。"
      redirect_to(issue_path(params[:issue_id]))
    end
  end

  def having_stock_check
    @contract = Contract.find_by(user_id: current_user.id, stock_number: params[:issue_id])
    if @contract == nil
      flash[:notice] = "この銘柄を保有していません。"
      redirect_to(issue_path(params[:issue_id]))
    end
  end

  def transaction_check
    @issue = Issue.find_by(id: params[:issue_id])
    @buy = Buy.order(price: :desc).find_by(issue_id: @issue.id)
    @sell = Sell.order(price: :asc).find_by(issue_id: @issue.id)
    if @buy.price == @sell.price && @buy.amount == @sell.amount
      @contract_buy = Contract.new(user_id: @buy.user_id, stock_number: @buy.issue_id, price: @buy.price, amount: @buy.amount)
      @contract_sell = Contract.find_by(user_id: @sell.user_id, stock_number: @sell.issue_id, amount: @sell.amount)
      @user_buy = User.find_by(id: @buy.user_id)
      @user_sell = User.find_by(id: @sell.user_id)

      ActiveRecord::Base.transaction do
        if @contract_buy.save
          @buy.destroy
          @sell.destroy
          # buy / sell と紐付けた contract_id = nilならみ約定、!= nilなら約定。
          @contract_sell.destroy

          @contracts = Contract.where(stock_number: @issue.id, created_at: Time.zone.today.all_day)
          contract_min = @contracts.order(price: :asc).first
          contract_max = @contracts.order(price: :desc).first
          contract_start = @contracts.order(created_at: :asc).first
          contract_end = @contracts.order(created_at: :desc).first
          # ※注意： .limit(1)で取得すると.priceとかで値を取得できない。
          @stock = Stock.find_or_create_by(stock_number: @issue.stock_number, date: Date.today)
          @stock.min_price = contract_min.price
          @stock.start_price = contract_start.price
          @stock.end_price = contract_end.price
          @stock.max_price = contract_max.price
          @stock.save

          @user_buy.available -= @buy.price * @buy.amount
          @user_sell.available += @sell.price * @sell.amount
          @user_buy.save
          @user_sell.save
          flash[:notice] ="約定しました。"
        end
      end
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:available])
    end

end

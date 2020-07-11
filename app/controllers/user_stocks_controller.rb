class UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was successfuly added to your portofolio"
    redirect_to my_portofolio_path
  end

  def destroy
    sotck = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stocl.destroy
    flash[:notice] = "#{stock.ticker} was successfully removed from portofolio"
    redirect_to my_portofolio_path
  end

end

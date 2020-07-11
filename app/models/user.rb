class User < ApplicationRecord
  has_many :user_stocks
  has_many :stocks, through: :user_stocks 
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # check if ticker_symbol exist in the db 
  def stock_already_tracked?(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    # check if the user is tracking the stock
    user.stocks.where(id: stock.id).exists?
  end
  
  # limit the number of stocks an user can track
  def under_stock_limit?
    user.stocks.count < 10
  end

  # check if the user can track the stock 
  def can_track_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_tracked?(ticker_symbol)
  end

end

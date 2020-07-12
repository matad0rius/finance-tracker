class UsersController < ApplicationController
  def my_portofolio
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end
end


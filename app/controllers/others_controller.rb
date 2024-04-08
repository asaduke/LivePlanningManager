class OthersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile
    departure_date = params.fetch(:departure_date, Date.today).to_date
    @lives = @user.lives.where(departure_time: departure_date.beginning_of_month..departure_date.end_of_month)
  end
end

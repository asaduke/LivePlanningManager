class OthersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile
  end
end

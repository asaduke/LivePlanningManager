class TopsController < ApplicationController
  skip_before_action :require_login, only: :top

  def top
    if current_user
      redirect_to lives_path
    else
      render :top
    end
  end
end

class ToppagesController < ApplicationController
  def index
    if logged_in?
      @big_purposes = current_user.big_purposes.where('done = false').order(id: :desc).page(params[:page]).per(10)
    end
  end
end

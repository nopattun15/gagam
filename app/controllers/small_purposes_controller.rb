class SmallPurposesController < ApplicationController
  before_action :set_big_purpose
  before_action :set_small_purpose, only: [:show, :edit, :finish]
  
  def index
    @small_purposes = @big_purpose.small_purposes.where('done = false').order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @time_reports = @small_purpose.time_reports.order(played_date: :asc)
    @growth_reports = @small_purpose.growth_reports.order(count: :asc)
  end

  def new
    @small_purpose = current_user.small_purposes.build
  end

  def create
    @small_purpose = current_user.small_purposes.build(small_purpose_params)
    @small_purpose.big_purpose_id = params[:big_purpose_id]
    
    if @small_purpose.save
      flash[:success] = '小目標が作成されました'
      redirect_to big_purpose_small_purposes_path(@big_purpose)
    else
      flash.now[:danger] = '小目標が作成されませんでした'
      render :new
    end 
  end

  def edit
  end

  def update
    @small_purpose = current_user.small_purposes.find(params[:id])
    @small_purpose.big_purpose_id = params[:big_purpose_id]

    if @small_purpose.update(small_purpose_params)
      flash[:success] = '小目標が変更されました'
      redirect_to big_purpose_small_purposes_path(@big_purpose)
    else
      flash.now[:danger] = '小目標が変更されませんでした'
      render :edit
    end 
  end
  
  def finish
    @small_purpose.update_attribute(:done, true)
    redirect_back(fallback_location: root_path)
  end

  def completed
    @small_purposes = @big_purpose.small_purposes.where('done = true').order(updated_at: :desc).page(params[:page]).per(10)
  end
  
  private
  
  def set_big_purpose
    @big_purpose = BigPurpose.find(params[:big_purpose_id])
  end 
  
  def set_small_purpose
    @small_purpose = @big_purpose.small_purposes.find(params[:id])
  end 
  
  def small_purpose_params
    params.require(:small_purpose).permit(:title, :time_limit)
  end
end

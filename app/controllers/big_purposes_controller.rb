class BigPurposesController < ApplicationController
  def index
    @big_purposes = current_user.big_purposes.where('done = false').order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @big_purpose = current_user.big_purposes.find(params[:id])
    @small_purposes = @big_purpose.small_purposes.where('done = false').order(id: :desc).page(params[:page]).per(10)
    
  end

  def new
    @big_purpose = current_user.big_purposes.build
  end
  
  def create
    @big_purpose = current_user.big_purposes.build(big_purpose_params)
    
    if @big_purpose.save
      flash[:success] = '大目標が作成されました'
      redirect_to root_path
    else
      flash.now[:danger] = '大目標が作成されませんでした'
      render :new
    end 
  end 

  def edit
    @big_purpose = current_user.big_purposes.find(params[:id])
  end
  
  def update
    @big_purpose = current_user.big_purposes.find(params[:id])
    
    if @big_purpose.update(big_purpose_params)
      flash[:success] = '大目標が変更されました'
      redirect_to root_path
    else
      flash.now[:danger] = '大目標が変更されませんでした'
      render :edit
    end 
  end
  
  def finish
    @big_purpose = BigPurpose.find(params[:id])
    @big_purpose.update_attribute(:done, true)
    redirect_back(fallback_location: root_path)
  end 
  
  def completed
    @big_purposes = current_user.big_purposes.where('done = true').order(updated_at: :desc).page(params[:page]).per(10)
  end
  
  private
  
  def big_purpose_params
    params.require(:big_purpose).permit(:title, :time_limit)
  end 
end

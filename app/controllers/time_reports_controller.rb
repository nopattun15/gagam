class TimeReportsController < ApplicationController
  
  def new
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @time_report = @small_purpose.time_reports.build
  end

  def create
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @time_report = @small_purpose.time_reports.build(time_report_params)
    
    if @time_report.save
      flash[:success] = '値が入力されました'
      redirect_to big_purpose_small_purpose_path(@small_purpose.big_purpose_id, @small_purpose)
    else
      flash.now[:danger] = '値が入力されませんでした'
      render :new
    end 
  end

  def edit
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @time_report = @small_purpose.time_reports.find(params[:id])
  end

  def update
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @time_report = @small_purpose.time_reports.find(params[:id])
    
    if @time_report.update(time_report_params)
      flash[:success] = '値が変更されました'
      redirect_to big_purpose_small_purpose_path(@small_purpose.big_purpose_id, @small_purpose)
    else
      flash[:danger] = '値が変更されませんでした'
      render :edit
    end 
  end
  
  private
  
  def time_report_params
    params.require(:time_report).permit(:played_time, :played_date)
  end 
end

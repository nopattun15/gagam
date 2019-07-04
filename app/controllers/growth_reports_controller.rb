class GrowthReportsController < ApplicationController
  
  def new
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @growth_report = @small_purpose.growth_reports.build
  end

  def create
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @growth_report = @small_purpose.growth_reports.build(growth_report_params)
    
    
    if @growth_report.save
      flash[:success] = '値が作成されました'
      redirect_to big_purpose_small_purpose_path(@small_purpose.big_purpose_id, @small_purpose)
    else
      flash.now[:danger] = '値が作成されませんでした'
      render :new 
    end 
  end

  def edit
    @small_purpose = current_user.small_purposes.find(params[:small_purpose_id])
    @growth_report = @small_purpose.growth_reports.find(params[:id])
  end

  def update
    @small_purpose = current_user.smallpurpose.find(params[:small_purpose_id])
    @growth_report = @small_purpose.growth_report.find(params[:id])
    
    if @growth_report.update(growth_report_params)
      flash[:success] = '成長度が変更されました'
      redirect_to big_purpose_small_purpose_path(@small_purpose.big_purpose_id, @small_purpose)
    else
      flash.now[:danger] = '成長度が変更されませんでした'
      render :edit
    end 
  end
  
  private
  
  def growth_report_params
    params.require(:growth_report).permit(:amount, :count)
  end 
end

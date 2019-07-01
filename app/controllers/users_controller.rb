class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show,:edit]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "ユーザーが登録されました"
        redirect_to '/login'

    else
      flash.now[:danger] = "ユーザーが登録されませんでした"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password].present?
      if !@user.authenticate(params[:present_password])
        flash.now[:danger] = "正しいパスワードではありません。"
        render :edit
      else
        if @user.update(user_params_with_password)
          flash[:success] = "登録内容が変更されました"
          redirect_to @user
        else
          flash.now[:danger] = "登録内容が変更されませんでした"
          render :edit
        end
      end
    else
      if @user.update(user_params)
        flash[:success] = "登録内容が変更されました"
        redirect_to @user
      else
        flash.now[:danger] = "登録内容が変更されませんでした"
        render :edit
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def user_params_with_password
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

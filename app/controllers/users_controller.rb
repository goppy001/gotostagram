class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user  = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Gotostagramへようこそ"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flahs[:success] = "プロフィールが変更されました"
      rediretct_to @user
      #更新に成功した場合を扱う
    else
      render 'edit'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end    

    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end

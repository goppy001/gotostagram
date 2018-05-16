class SessionsController < ApplicationController
  layout nil
  def new
    render :layout => nil
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) :forget(user)
      redirect_back_or root_path
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが違います'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

end

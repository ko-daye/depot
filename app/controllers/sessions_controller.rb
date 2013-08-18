class SessionsController < ApplicationController

  skip_before_filter :authorize
  def new
    @form_title = "ログインしてください。"
    @button_title = "ログイン"
  end

  def reconfirm
    @form_title = "パスワードを再確認します。"
    @button_title = "確認"
  end

  def reconfirm_check
    user = User.find_by_name(params[:name])

    unless session[:user_id]
      redirect_to admin_url
      return
    end

    if user and user.authenticate(params[:password]) && session[:user_id] == user.id
      redirect_to edit_user_path(params[:id])
    else
      redirect_to reconfirm_url, alert: "無効なユーザ/パスワードの組み合わせです。"
    end
  end

  def create

    user = User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "無効なユーザ/パスワードの組み合わせです。"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "ログアウト"
  end
end

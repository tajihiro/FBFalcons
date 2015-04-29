#coding: utf-8
# Admin::AuthenticationController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.13

class Admin::AuthenticationController < ApplicationController
  #
  # ログイン画面表示処理
  #
  def login
    if session[:is_login] == true then
      redirect_to admin_menu_index_path 
    end
  end

  #
  # ログイン認証処理
  #
  def auth
    passwd = params[:passwd]
    if passwd == '****' then
      #ログイン情報セッション登録
      session[:is_login] = true
      redirect_to admin_menu_index_path 
    else      
      reset_session
      flash[:msg] = "パスワードが不正です。"
      redirect_to admin_authentication_login_path
    end
  end

  #
  # ログアウト処理
  #
  def logout
    reset_session
    flash[:msg] = "ログアウトしました。"
    redirect_to admin_authentication_login_path
  end
end

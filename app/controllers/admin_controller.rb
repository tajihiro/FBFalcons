class AdminController < ApplicationController
  layout "admin"
  before_filter :check_login
  
  #
  # ログイン判定処理
  #
  private 
  def check_login
    if session[:is_login] then
      return      
    else
      redirect_to admin_login_index_path
    end
  end
end

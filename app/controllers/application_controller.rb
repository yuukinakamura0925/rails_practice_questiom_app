class ApplicationController < ActionController::Base
  # railsでデフォルト以外のフラッシュをセットする
  add_flash_types :success, :info, :warning, :danger

  def current_user
    # この形だとcurrent_userメソッドが呼ばれるたびにSQLが走っってしまう
    # User.find_by(id: session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :current_user
  # viewで使えるようにするために
end

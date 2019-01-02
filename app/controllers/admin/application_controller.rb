class Admin::ApplicationController < ApplicationController
  layout "dashboard"

  def logged_in_admin
    unless logged_in?
      flash[:danger] = t ".please_login"
      redirect_to login_url
      return
    end
    return if current_member.admin?
    redirect_to root_url
  end
end

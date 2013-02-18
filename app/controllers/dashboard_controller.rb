class DashboardController < ApplicationController
  def index
    @user_session = UserSession.new
    if request.post?
      @user_session = UserSession.new(params[:user_session])
      if @user_session.save
        flash[:notice] = "Login successful!"
        redirect_back_or_default dashboard_url
      else
        render :action => :new
      end
    end
  end
end

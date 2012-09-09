class LoginController < ApplicationController
  skip_before_filter :check_logined
  def auth
    usr = User.authenticate(params[:username],params[:password])
    if usr then
      session[:usr] = usr.id
      redirect_to categories_path
    else
      flash.now[:referer] = params[:referer]
      @error = 'Username or Password mismatch'
      render 'index'
    end
  end
end

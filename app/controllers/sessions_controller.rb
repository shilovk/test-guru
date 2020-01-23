# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies.delete(:return_to) || tests_path
    else
      flash.now[:alert] = 'Please, verify your Email and Password'
      render :new
    end
  end

  def delete
    session[:user_id] = nil

    redirect_to login_path, notice: 'You are logout, bye!'
  end
end

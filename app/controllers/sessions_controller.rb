# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:return_to] || tests_path

      cookies[:return_to] = nil
    else
      flash.now[:alert] = 'Please, verify your Email and Password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path, notice: 'You are logout, bye!'
  end
end

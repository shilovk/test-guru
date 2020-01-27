# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    current_user.admin? ? admin_tests_path : (stored_location_for(resource) || root_path)
  end
end

# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :set_badges

  def index
    @badges_uniq = @badges.uniq
  end

  def show
    @badge = @badges.find(params[:id])
  end

  private

  def set_badges
    @badges = current_user.badges
  end
end

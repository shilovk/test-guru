# frozen_string_literal: true

# Admin::BadgesController < Admin::BaseController
class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    rescue_with_badge_not_found(exception.id)
  end

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)

      redirect_to [:admin, @badge], notice: 'Succussfuly updated'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t('.success')
  end

  private

  def rescue_with_badge_not_found(id)
    redirect_to admin_badges_path, alert: "Badge #{id} was not found"
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def purge
    @badge&.image.purge if params[:purge]
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :category_id, :test_level, :is_first_try)
  end
end

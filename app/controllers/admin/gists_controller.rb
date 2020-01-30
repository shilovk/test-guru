# frozen_string_literal: true

# Admin::GistsController < Admin::BaseController
class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end

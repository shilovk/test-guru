class Gist < ApplicationRecord
  GISTS_ROOT_URL = 'https://gist.github.com/'.freeze

  belongs_to :user
  belongs_to :question

  validates :gist_id, presence: true

  def gist_url
    GISTS_ROOT_URL + gist_id
  end
end

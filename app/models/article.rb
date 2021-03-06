class Article < ApplicationRecord
	extend FriendlyId
  friendly_id :title, use: :slugged

  scope :most_recent, -> { order(id: :desc) }

  def should_generate_new_friendly_id?
  	title_changed?
  end

  def published_date
    "Published #{created_at.strftime('%-b %-Y')}"
  end
  
end

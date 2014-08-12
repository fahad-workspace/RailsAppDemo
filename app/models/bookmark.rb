class Bookmark < ActiveRecord::Base
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end

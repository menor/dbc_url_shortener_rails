class Url < ActiveRecord::Base
  before_save :short_url_generator
  validates :short_url, :long_url, uniqueness: true
  validates :long_url, :click_count, presence: true
  validates_format_of :long_url, with: URI::regexp(%w(http https)), on: :create, message: 'Submit a valid URL that starts with "http://" or "https://"'
  attr_accessible :short_url, :long_url, :click_count


  def short_url_generator
    self.short_url = "#{self.long_url.hash.abs.to_s(36)}"
  end
end
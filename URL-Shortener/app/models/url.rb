Class Url < ActiveRecord::Base
  validates_uniqueness_of :short_url
  validates_format_of :long_url, with: URI::regexp(%w(http https)), on: :create, message: 'Submit a valid URL that starts with "http://" or "https://"'
  before_save :short_url_generator

  def short_url_generator
    self.short_url = "#{self.hash.abs.to_s(36)}"
  end
end
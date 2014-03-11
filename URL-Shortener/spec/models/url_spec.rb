require 'spec_helper'
describe Url do

  context "validations" do
    it { should validate_presence_of :long_url }
    it { should validate_presence_of :click_count }
    it { should validate_uniqueness_of :long_url }
  end

end
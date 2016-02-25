require 'securerandom'

class Voter < ActiveRecord::Base
  has_one :vote

  validates :name, presence: true
  validates :party, presence: true
  validates :token, presence: true

  before_validation :ensure_token_exists

  protected
    def ensure_token_exists
      self.token = token || SecureRandom.hex
    end
end

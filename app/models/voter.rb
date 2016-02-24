class Voter < ActiveRecord::Base
  has_one :vote

  validates :name, presence: true
  validates :party, presence: true
  validates :token, presence: true
end

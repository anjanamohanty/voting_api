class Candidate < ActiveRecord::Base
  belongs_to :race
  has_many :votes

  validates :name, presence: true
  validates :district, presence: true
  validates :hometown, presence: true
  validates :party, presence: true
end

class Candidate < ActiveRecord::Base
  belongs_to :race
  has_many :votes

  validates :name, presence: true
  validates :district, presence: true
  validates :hometown, presence: true
  validates :party, presence: true

  def as_json(options = nil)
    {
      id: id,
      name: name,
      party: party,
      district: district,
      hometown: hometown,
      votes: votes.count
    }
  end
end

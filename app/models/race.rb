class Race < ActiveRecord::Base
  has_many :candidates
  has_many :votes

  validates :name, presence: true

  def as_json(options = nil)
    {
      name: name,
      candidates: candidates
    }
  end
end

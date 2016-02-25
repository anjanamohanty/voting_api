class Vote < ActiveRecord::Base
  belongs_to :voter
  belongs_to :race
  belongs_to :candidate

  validates :voter_id, uniqueness: {scope: "race_id"}
end

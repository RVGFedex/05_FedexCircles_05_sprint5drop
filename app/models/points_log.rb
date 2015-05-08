class PointsLog < ActiveRecord::Base
  belongs_to :circle
  has_one :policy
  belongs_to :reward_takeup
end

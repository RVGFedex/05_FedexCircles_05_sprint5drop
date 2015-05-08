class RewardTakeup < ActiveRecord::Base
  belongs_to :reward
  belongs_to :user
end

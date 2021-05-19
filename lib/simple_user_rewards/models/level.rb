class SimpleUserRewards::Level < ActiveRecord::Base
  has_many :user_level_rewards
end

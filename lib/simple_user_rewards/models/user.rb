require 'active_record'
require 'simple_user_rewards/models/concerns/levelable'
require 'simple_user_rewards/models/concerns/level_rewardable'

class SimpleUserRewards::User < ActiveRecord::Base
  include SimpleUserRewards::Levelable
  include SimpleUserRewards::LevelRewardable
end

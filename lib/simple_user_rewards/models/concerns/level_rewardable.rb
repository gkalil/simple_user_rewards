module SimpleUserRewards::LevelRewardable
  extend ActiveSupport::Concern

  included do
    before_update :apply_reward, if: :level_up?
  end

  private

  def apply_reward
    rewards = []

    levels_up.each do |level|
      rewards.concat(level.user_level_rewards)
    end

    rewards.each do |reward|
      assign_attributes({ reward.column => send(reward.column) + BigDecimal(reward.value) })
    end
  end
end

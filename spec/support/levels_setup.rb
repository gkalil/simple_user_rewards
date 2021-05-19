shared_context 'basic levels setup' do
  let!(:level_1) { SimpleUserRewards::Level.create!(experience: 0) }
  let!(:level_2) { SimpleUserRewards::Level.create!(experience: 10) }
  let!(:level_3) { SimpleUserRewards::Level.create!(experience: 13) }

  let!(:tax_reward_level_2) do
    SimpleUserRewards::UserLevelReward.create!({
      level_id: level_2.id, column: 'tax', value: -1
    })
  end

  let!(:coin_reward_level_2) do
    SimpleUserRewards::UserLevelReward.create!({
      level_id: level_2.id, column: 'coins', value: 7
    })
  end

  let!(:tax_reward_level_3) do
    SimpleUserRewards::UserLevelReward.create!({
      level_id: level_3.id, column: 'tax', value: -3
    })
  end

  let!(:coin_reward_level_3) do
    SimpleUserRewards::UserLevelReward.create!({
      level_id: level_3.id, column: 'coins', value: 10
    })
  end
end

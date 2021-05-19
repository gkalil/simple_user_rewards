require 'spec_helper'

describe SimpleUserRewards::User do
  it_behaves_like "levelable"
  it_behaves_like "level_rewardable"
end

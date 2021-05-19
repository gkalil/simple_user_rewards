require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'bundler/setup'

require 'simple_user_rewards'

require 'support/init_database'
require 'support/database_cleaner'

RSpec.configure { |config| }

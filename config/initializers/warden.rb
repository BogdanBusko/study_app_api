require 'strategies/api_token_strategy.rb'

Warden::Strategies.add(:api_token, ApiTokenStrategy)

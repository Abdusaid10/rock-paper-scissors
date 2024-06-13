FactoryBot.define do
  factory :game do
    association :user
    user_choice { %w[rock paper scissors hammer].sample }
    server_choice { %w[rock paper scissors hammer].sample }
    result { Game.determine_winner(user_choice, server_choice) }
  end
end
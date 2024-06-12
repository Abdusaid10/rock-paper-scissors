# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user

  validates :user_choice, inclusion: { in: %w[rock paper scissors] }
  validates :server_choice, inclusion: { in: %w[rock paper scissors] }

  WINNING_COMBINATIONS = {
    rock: 'scissors',
    scissors: 'paper',
    paper: 'rock'
  }.freeze  

  def self.determine_winner(user_choice, server_choice)
    return "tie" if user_choice == server_choice

    WINNING_COMBINATIONS[user_choice] == server_choice ? 'win' : 'lose'
  end
end

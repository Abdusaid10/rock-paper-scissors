# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user

  validates :user_choice, inclusion: { in: %w[rock paper scissors hammer] }
  validates :server_choice, inclusion: { in: %w[rock paper scissors hammer] }

  # Rock beats Scissors and Hammer.
  # Paper beats Rock.
  # Scissors beats Paper.
  # Hammer beats Scissors and Paper.
  WINNING_COMBINATIONS = {
    rock: %w[scissors hammer],
    scissors: 'paper',
    paper: 'rock',
    hammer: %w[scissors paper]
  }.freeze  

  def self.determine_winner(user_choice, server_choice)
    return "tie" if user_choice == server_choice

    WINNING_COMBINATIONS[user_choice] == server_choice ? 'win' : 'lose'
  end
end

# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user

  # Rock beats Scissors and Hammer.
  # Paper beats Rock.
  # Scissors beats Paper.
  # Hammer beats Scissors and Paper.
  RPSH_OPTIONS = %w[rock paper scissors hammer].freeze
  WINNING_COMBINATIONS = {
    rock: %w[scissors hammer],
    scissors: 'paper',
    paper: 'rock',
    hammer: %w[scissors paper]
  }.freeze  

  validates :user_choice, inclusion: { in: RPSH_OPTIONS }
  validates :server_choice, inclusion: { in: RPSH_OPTIONS }

  def self.determine_winner(user_choice, server_choice)
    return nil if user_choice.nil? || server_choice.nil?
    return "tie" if user_choice == server_choice

    WINNING_COMBINATIONS[user_choice.to_sym]&.include?(server_choice) ? 'win' : 'lose'
  end
end

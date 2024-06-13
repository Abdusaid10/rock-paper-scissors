require 'rails_helper'

RSpec.describe Game, type: :model do
  it "has a valid factory" do
    expect(build(:game)).to be_valid
  end

  it "is invalid without a user" do
    game = build(:game, user: nil)
    expect(game).not_to be_valid
  end

  it "is invalid without a user_choice" do
    game = build(:game, user_choice: nil)
    expect(game).not_to be_valid
  end

  it "is invalid without a server_choice" do
    game = build(:game, server_choice: nil)
    expect(game).not_to be_valid
  end

  describe ".determine_winner" do
    it "returns tie when both choices are the same" do
      expect(Game.determine_winner('rock', 'rock')).to eq('tie')
    end

    it "returns win when user_choice beats server_choice" do
      expect(Game.determine_winner('rock', 'scissors')).to eq('win')
      expect(Game.determine_winner('rock', 'hammer')).to eq('win')
      expect(Game.determine_winner('scissors', 'paper')).to eq('win')
      expect(Game.determine_winner('paper', 'rock')).to eq('win')
      expect(Game.determine_winner('hammer', 'scissors')).to eq('win')
      expect(Game.determine_winner('hammer', 'paper')).to eq('win')
    end

    it "returns lose when server_choice beats user_choice" do
      expect(Game.determine_winner('scissors', 'rock')).to eq('lose')
      expect(Game.determine_winner('hammer', 'rock')).to eq('lose')
      expect(Game.determine_winner('paper', 'scissors')).to eq('lose')
      expect(Game.determine_winner('rock', 'paper')).to eq('lose')
      expect(Game.determine_winner('scissors', 'hammer')).to eq('lose')
      expect(Game.determine_winner('paper', 'hammer')).to eq('lose')
    end

    it "returns nil when user_choice is nil" do
      expect(Game.determine_winner(nil, 'rock')).to be_nil
    end

    it "returns nil when server_choice is nil" do
      expect(Game.determine_winner('rock', nil)).to be_nil
    end
  end
end
# frozen_string_literal: true

class GamesController < ApplicationController

  def index
    @user = User.find_by(name: params[:user_name])
    @games = @user.games.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.html { render partial: 'games/game_list', locals: { games: @games } }
      format.js { render partial: 'games/append_game_list', locals: { games: @games } }
    end
  end

  def new
    @game = Game.new
  end

  def create
    @user = User.find_or_create_by(name: game_params[:user_name])
    user_choice = game_params[:user_choice]
    server_choice = fetch_server_choice || Game::RPSH_OPTIONS.sample

    result = Game.determine_winner(user_choice, server_choice)

    @game = @user.games.create(
      user_choice: user_choice,
      server_choice: server_choice,
      result: result
    )

    respond_to do |format|
      format.html { redirect_to @game }
      format.turbo_stream
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:user_name, :user_choice)
  end

  def fetch_server_choice
    response = HTTParty.get('https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw')

    JSON.parse(response.body) if response.success?
  rescue
    nil
  end
end
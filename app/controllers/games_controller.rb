# frozen_string_literal: true

# GamesController is the main controller in the application.
class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games or /games.json
  def index
    @games = Game.where(owner: current_user)
  end

  # GET /games/1 or /games/1.json
  def show; end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit; end

  # POST /games or /games.json
  def create # rubocop:disable Metrics/AbcSize
    @game = Game.new(game_params)
    @game.owner = current_user

    respond_to do |format|
      if @game.save
        format.html { redirect_to game_url(@game), notice: I18n.t('notices.game.created') }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to game_url(@game), notice: I18n.t('notices.game.updated') }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_url, notice: I18n.t('notices.game.destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name)
  end
end

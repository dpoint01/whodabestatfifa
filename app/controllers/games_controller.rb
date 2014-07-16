class GamesController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @game = Game.new
  end

  def create
    @group = Group.find(params[:group_id])
    @game = Game.new(game_params)


    @game.group = @group
    @game.creator_id = current_user.id

    if @game.save
      redirect_to @group, notice: 'Game was successfully saved'
    else
      redirect_to @group , alert: "Your game couldnt be saved."
    end

  end

  def game_params
    params.require(:game).permit(:creator_id, :opponent_id, :winner_id,
                                 :loser_id, :creator_score, :opponent_score,
                                 :group_id, :draw?)
  end
end

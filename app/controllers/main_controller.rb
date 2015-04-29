#coding: utf-8
# MainController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.08
class MainController < PortalController
  def index
    #最新Game情報取得
    @recent_game = Game.maximum(:id, :conditions =>{:team_id => 1,  :game_date => Game.maximum(:game_date)})
    @game = Game.find(@recent_game)

    sql = "select M.last_name,
                  S.member_id member_id,
                  S.goal goal,
                  S.assist assist,
                  (S.goal + S.assist) as point,
                  S.goal_against goal_against,
                  S.shot_on_goal shot_on_goal,
                  (S.shot_on_goal - S.goal_against) as saves,
                  ((S.shot_on_goal - S.goal_against) / S.shot_on_goal) as save_ave,
                  S.penalties penalties,
                  S.mvp_flg,
                  S.goalie_flg
             from game_members S
             left join members M
               on S.member_id = M.id
             left join games G
               on S.game_id = G.id
            where G.id = :game_id 
            order by (S.goal + S.assist) DESC"
    @game_members = GameMember.find_by_sql([sql,{:game_id => @game.id}])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end
end

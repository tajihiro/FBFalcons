#coding: utf-8
# GamesController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.10
class GamesController < PortalController
  #
  # Season一覧
  #
  def seasons
    @seasons = Season.order('id DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seasons }
    end

    #
    # Season結果
    #
    def season_result
      @season = Season.find(params[:id])
      @games = Game.find_all_by_season_id(@season.id)

      sql = "select M.last_name,
                    S.member_id member_id,
                    sum(S.goal) goal,
                    sum(S.assist) assist,
                    sum(S.goal_against) goal_against,
                    sum(S.shot_on_goal) shot_on_goal,
                    sum(S.penalties) penalties,
                    sum(S.mvp_flg) mvp_flg,
                    sum(S.goal + S.assist) point,
                    sum(S.shot_on_goal - S.goal_against) saves,
                    (sum(S.shot_on_goal) - sum(S.goal_against)) / sum(S.shot_on_goal) save_ave,
                    S.goalie_flg
               from game_members S
               left join members M
                 on S.member_id = M.id
               left join games G
                 on S.game_id = G.id
              where G.season_id = :season_id
              group by S.member_id, S.goalie_flg 
              order by sum(S.goal + S.assist) DESC"
      @game_members = GameMember.find_by_sql([sql,{:season_id => @season.id}])

      respond_to do |format|
        format.html
        format.json { render json: @season }
      end
    end

    #
    # Game結果
    #
    def game_result
      @game = Game.find(params[:id])
      sql = "select M.last_name,
                    S.member_id member_id,
                    S.goal goal,
                    S.assist assist,
                    (S.goal + S.assist) point,
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
        format.html
        format.json { render json: @season }
      end
      

    end

  end
end

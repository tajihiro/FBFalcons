#coding: utf-8
# PlayersController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.12
class PlayersController < PortalController
  def index
    @members = Member.order('jersey_number')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seasons }
    end

  end

  def detail
    @member = Member.find(params[:id])
    sql = "select G.season_id, S.season_name,
                  G.division_id, G.team_id, R.goalie_flg,
                  sum(R.goal) as goal,
                  sum(R.assist) as assist,
                  sum(R.goal + R.assist) as point,
                  sum(R.shot_on_goal) - sum(R.goal_against) as saves,
                  (sum(R.shot_on_goal) - sum(R.goal_against)) / sum(R.shot_on_goal) as save_ave,
                  sum(R.goal_against) as goal_against,
                  sum(R.shot_on_goal) as shot_on_goal,
                  sum(R.penalties) as penalties,
                  sum(R.mvp_flg) as mvp_cnt
             from game_members R
             left join games G
               on R.game_id = G.id
             left join seasons S
               on S.id = G.season_id               
            where member_id = :member_id
            group by G.season_id, G.division_id, G.team_id, R.goalie_flg
            order by G.season_id desc;"
    @records = GameMember.find_by_sql([sql,{:member_id => @member.id}])
    
  end
end

#coding: utf-8

# StatsController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.10
class StatsController < PortalController
  def index
    sql = "select M.last_name,
                  S.member_id member_id,
                  sum(S.goal) goal, 
                  sum(S.assist) assist,
                  sum(S.goal_against) goal_against,
                  sum(S.shot_on_goal) shot_on_goal,
                  sum(S.penalties) penalties,
                  sum(S.mvp_flg),
                  S.goalie_flg
             from game_members S
             left join members M
               on S.member_id = M.id
            group by S.member_id, S.goalie_flg "
    @game_members = GameMember.find_by_sql(sql)
  end
end

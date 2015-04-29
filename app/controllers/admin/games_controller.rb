#coding: utf-8
# Admin::GamesController
# Author:: Hiroyuki, Tajima
# Date:: 2013.06.14
class Admin::GamesController < AdminController
  #
  # Game一覧
  #
  def index
    @seasons = Season.order('id DESC')

    respond_to do |format|
      format.html # index.html.erb
      #format.json { render json: @games }
    end
  end

  #
  # Game一覧
  #
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  #
  # Add Game
  #
  def new
    season_id = params[:season_id]
    #Game
    @game = Game.new
    @game.season_id = season_id
    @game.division_id = 4
    @game.team_id = 1
    @game.game_place = "MiSC"
    #SeasonMembers取得
    @season_members = SeasonMember.find_all_by_season_id(season_id)
    
    #表示項目取得
    sql = "select R.team_id team_id,
                  T.team_name team_name
             from season_teams R 
             left join teams T 
               on R.team_id = T.id 
            where R.season_id = :season_id "
    @season_teams = SeasonTeam.find_by_sql([sql, {:season_id => season_id}])        
            
    
    respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    #Game取得
    @game = Game.find(params[:id])
    #SeasonMembers取得
    @season_members = SeasonMember.find_all_by_season_id(@game.season_id)
    #GameMembers取得
    @game_members = GameMember.find_all_by_game_id(@game.id)
   
    #表示項目取得
    sql = "select R.team_id team_id,
                  T.team_name team_name
             from season_teams R 
             left join teams T 
               on R.team_id = T.id 
            where R.season_id = :season_id "
    @season_teams = SeasonTeam.find_by_sql([sql, {:season_id => @game.season_id}])        
    
  end

  #
  # Create Games
  #
  def create
    @game = Game.new(params[:game])
    member_ids = params[:member_id]
    goals = params[:goal]
    assists = params[:assist]
    penalties = params[:penalties]
    goal_againsts = params[:goal_against]
    shot_on_goal = params[:shot_on_goal]
    goalie_flgs = params[:goalie_flg]
    mvp_flgs = params[:mvp_flg]
    join_flgs = params[:join_flg]

    respond_to do |format|
      if @game.save then
        member_ids.each_with_index do |member_id, i|
          if !join_flgs.nil? then
            if join_flgs.key?(member_id) then
              @game_member = GameMember.new
              @game_member.game_id = @game.id
              @game_member.member_id = member_ids[i]
              @game_member.goal = goals[i]
              @game_member.assist = assists[i]
              @game_member.penalties = penalties[i]
              @game_member.goal_against = goal_againsts[i]
              @game_member.shot_on_goal = shot_on_goal[i]
              if !goalie_flgs.nil? then
                @game_member.goalie_flg = (goalie_flgs.key?(member_id) ? 1 : 0)
              end
              if !mvp_flgs.nil? then
                @game_member.mvp_flg = (mvp_flgs.key?(member_id) ? 1 : 0)
              end
              @game_member.save
            end
          end
        format.html { redirect_to admin_games_path, notice: 'Game was successfully created.' }
        #format.json { render json: @game, status: :created, location: @game }
        end
      else
        format.html { render new_admin_game_path }
        #format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])
    member_ids = params[:member_id]
    goals = params[:goal]
    assists = params[:assist]
    penalties = params[:penalties]
    goal_againsts = params[:goal_against]
    shot_on_goal = params[:shot_on_goal]
    goalie_flgs = params[:goalie_flg]
    mvp_flgs = params[:mvp_flg]
    join_flgs = params[:join_flg]
    
    
    respond_to do |format|
      if @game.update_attributes(params[:game])
        GameMember.delete_all(['game_id = ?', @game.id])
        member_ids.each_with_index do |member_id, i|
          if !join_flgs.nil? then
            if join_flgs.key?(member_id) then
              @game_member = GameMember.new
              @game_member.game_id = @game.id
              @game_member.member_id = member_ids[i]
              @game_member.goal = goals[i]
              @game_member.assist = assists[i]
              @game_member.penalties = penalties[i]
              @game_member.goal_against = goal_againsts[i]
              @game_member.shot_on_goal = shot_on_goal[i]
              if !goalie_flgs.nil? then
                @game_member.goalie_flg = (goalie_flgs.key?(member_id) ? 1 : 0)
              end
              if !mvp_flgs.nil? then
                @game_member.mvp_flg = (mvp_flgs.key?(member_id) ? 1 : 0)
              end
              @game_member.save
            end
          end
        end
        format.html { redirect_to admin_games_path, notice: 'Game was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render edit_admin_game_path }
        #format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end

class Admin::SeasonTeamsController < AdminController
  # GET /admin/season_teams
  # GET /admin/season_teams.json
  def index
    @admin_season_teams = Admin::SeasonTeam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_season_teams }
    end
  end

  # GET /admin/season_teams/1
  # GET /admin/season_teams/1.json
  def show
    @admin_season_team = Admin::SeasonTeam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_season_team }
    end
  end

  # GET /admin/season_teams/new
  # GET /admin/season_teams/new.json
  def new
    @admin_season_team = Admin::SeasonTeam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_season_team }
    end
  end

  # GET /admin/season_teams/1/edit
  def edit
    @admin_season_team = Admin::SeasonTeam.find(params[:id])
  end

  # POST /admin/season_teams
  # POST /admin/season_teams.json
  def create
    @admin_season_team = Admin::SeasonTeam.new(params[:admin_season_team])

    respond_to do |format|
      if @admin_season_team.save
        format.html { redirect_to @admin_season_team, notice: 'Season team was successfully created.' }
        format.json { render json: @admin_season_team, status: :created, location: @admin_season_team }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_season_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/season_teams/1
  # PUT /admin/season_teams/1.json
  def update
    @admin_season_team = Admin::SeasonTeam.find(params[:id])

    respond_to do |format|
      if @admin_season_team.update_attributes(params[:admin_season_team])
        format.html { redirect_to @admin_season_team, notice: 'Season team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_season_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/season_teams/1
  # DELETE /admin/season_teams/1.json
  def destroy
    @admin_season_team = Admin::SeasonTeam.find(params[:id])
    @admin_season_team.destroy

    respond_to do |format|
      format.html { redirect_to admin_season_teams_url }
      format.json { head :no_content }
    end
  end
end

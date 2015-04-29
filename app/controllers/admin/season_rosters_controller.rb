class Admin::SeasonRostersController < AdminController
  # GET /season_rosters
  # GET /season_rosters.json
  def index
    @season_rosters = SeasonRoster.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @season_rosters }
    end
  end

  # GET /season_rosters/1
  # GET /season_rosters/1.json
  def show
    @season_roster = SeasonRoster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @season_roster }
    end
  end

  # GET /season_rosters/new
  # GET /season_rosters/new.json
  def new
    @season_roster = SeasonRoster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @season_roster }
    end
  end

  # GET /season_rosters/1/edit
  def edit
    @season_roster = SeasonRoster.find(params[:id])
  end

  # POST /season_rosters
  # POST /season_rosters.json
  def create
    @season_roster = SeasonRoster.new(params[:season_roster])

    respond_to do |format|
      if @season_roster.save
        format.html { redirect_to @season_roster, notice: 'Season roster was successfully created.' }
        format.json { render json: @season_roster, status: :created, location: @season_roster }
      else
        format.html { render action: "new" }
        format.json { render json: @season_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /season_rosters/1
  # PUT /season_rosters/1.json
  def update
    @season_roster = SeasonRoster.find(params[:id])

    respond_to do |format|
      if @season_roster.update_attributes(params[:season_roster])
        format.html { redirect_to @season_roster, notice: 'Season roster was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @season_roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /season_rosters/1
  # DELETE /season_rosters/1.json
  def destroy
    @season_roster = SeasonRoster.find(params[:id])
    @season_roster.destroy

    respond_to do |format|
      format.html { redirect_to season_rosters_url }
      format.json { head :no_content }
    end
  end
end

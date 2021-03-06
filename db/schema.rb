# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130806113021) do

  create_table "divisions", :force => true do |t|
    t.string   "division_name",    :limit => 30, :null => false
    t.string   "division_en_name", :limit => 30
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "game_members", :id => false, :force => true do |t|
    t.integer  "game_id",                       :null => false
    t.integer  "member_id",                     :null => false
    t.integer  "goal",         :default => 0,   :null => false
    t.integer  "assist",       :default => 0,   :null => false
    t.integer  "goal_against", :default => 0,   :null => false
    t.integer  "shot_on_goal", :default => 0,   :null => false
    t.float    "penalties",    :default => 0.0, :null => false
    t.integer  "goalie_flg",   :default => 0,   :null => false
    t.integer  "mvp_flg",      :default => 0,   :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "games", :force => true do |t|
    t.integer  "season_id",                                     :null => false
    t.integer  "division_id",                                   :null => false
    t.integer  "team_id",                                       :null => false
    t.string   "game_name",       :limit => 60,                 :null => false
    t.integer  "home_team_id",                                  :null => false
    t.integer  "home_team_score",                :default => 0, :null => false
    t.integer  "away_team_id",                                  :null => false
    t.integer  "away_team_score",                :default => 0, :null => false
    t.date     "game_date",                                     :null => false
    t.time     "game_time"
    t.string   "game_place",      :limit => 120
    t.text     "movie_url"
    t.text     "comments"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "last_name",     :limit => 20,                :null => false
    t.string   "first_name",    :limit => 20,                :null => false
    t.string   "last_en_name",  :limit => 20
    t.string   "first_en_name", :limit => 20
    t.string   "nick_name",     :limit => 20
    t.integer  "jersey_number"
    t.integer  "position_id"
    t.integer  "gender",        :limit => 1,  :default => 1, :null => false
    t.string   "address",       :limit => 30
    t.string   "birth_place",   :limit => 30
    t.date     "birthday"
    t.text     "image_url"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  add_index "members", ["position_id"], :name => "index_members_on_position_id"

  create_table "positions", :force => true do |t|
    t.string   "position_name", :limit => 8, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "prefectures", :force => true do |t|
    t.string   "prefecture_name", :limit => 10, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "sample_indices", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "season_members", :id => false, :force => true do |t|
    t.integer  "season_id",   :null => false
    t.integer  "division_id", :null => false
    t.integer  "team_id",     :null => false
    t.integer  "member_id",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "season_teams", :id => false, :force => true do |t|
    t.integer  "season_id",   :null => false
    t.integer  "division_id", :null => false
    t.integer  "team_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "season_teams", ["division_id"], :name => "index_admin_season_teams_on_division_id"
  add_index "season_teams", ["season_id"], :name => "index_admin_season_teams_on_season_id"
  add_index "season_teams", ["team_id"], :name => "index_admin_season_teams_on_team_id"

  create_table "seasons", :force => true do |t|
    t.string   "season_name",  :limit => 30, :null => false
    t.string   "season_start", :limit => 8
    t.string   "season_end",   :limit => 8
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "team_members", :id => false, :force => true do |t|
    t.integer  "team_id",    :null => false
    t.integer  "member_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "team_name",     :limit => 60, :null => false
    t.integer  "prefecture_id"
    t.string   "home_place",    :limit => 30
    t.string   "since",         :limit => 8
    t.text     "image_url"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "teams", ["prefecture_id"], :name => "index_teams_on_prefecture_id"

end

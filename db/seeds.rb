# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#coding: utf-8
require 'csv'

# Insert Data
CSV.foreach('db/DATA/prefectures.csv') do |col|
  Prefecture.create(
                prefecture_name: col[1])
end

CSV.foreach('db/DATA/divisions.csv') do |col|
  Division.create(
                division_name: col[1],
                division_en_name: col[2])
end

CSV.foreach('db/DATA/positions.csv') do |col|
  Position.create(
                position_name: col[1])
end

CSV.foreach('db/DATA/seasons.csv') do |col|
  Season.create(
                season_name: col[1],
                season_start: col[2],
                season_end: col[3])
end
CSV.foreach('db/DATA/members.csv') do |col|
  Member.create(
                last_name: col[1],
                first_name: col[2],
                last_en_name: col[3],
                first_en_name: col[4],
                nick_name: col[5],
                jersey_number: col[6],
                position_id: col[7],
                gender: col[8],
                address: col[9],
                birth_place: col[10],
                birthday: col[11],
                image_url: col[12]
                )
end

CSV.foreach('db/DATA/teams.csv') do |col|
  Team.create(
                team_name: col[1],
                prefecture_id: col[2],
                home_place: col[3],
                since: col[4],
                image_url: col[5]
                )
end
CSV.foreach('db/DATA/team_members.csv') do |col|
  Team.create(
                team_id: col[1],
                member_id: col[2]
                )
end


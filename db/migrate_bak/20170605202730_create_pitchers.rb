class CreatePitchers < ActiveRecord::Migration[5.0]
  def change
    create_table :pitchers do |t|
    t.integer  "pitcher_id"
    t.integer  "team_id"
    t.string  "throws"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "pitcher_name"
    t.string   "espn_name"
    t.string   "player_id"
    t.string   "position"

      t.timestamps

    end
  end
end

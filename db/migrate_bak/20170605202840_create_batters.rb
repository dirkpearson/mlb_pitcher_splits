class CreateBatters < ActiveRecord::Migration[5.0]
  def change
    create_table :batters do |t|
    t.integer  "bats_id"
    t.integer  "team_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "batter_name"
    t.string   "position"
    t.string   "espn_name"
    t.string   "player_id"

      t.timestamps

    end
  end
end

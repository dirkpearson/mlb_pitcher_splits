class CreatePitcherBatters < ActiveRecord::Migration[5.0]
  def change
    create_table :pitcher_batters do |t|
      t.integer  "pitcher_id"
      t.integer  "batter_id"
      t.string   "team_code"
      t.string   "np"
      t.string   "pa"
      t.string   "ab"
      t.string   "hits"
      t.integer  "double"
      t.integer  "triple"
      t.string   "hr"
      t.integer  "runs"
      t.integer  "rbi"
      t.integer  "bb"
      t.integer  "so"
      t.integer  "sb"
      t.string   "avg"
      t.string   "obp"
      t.string   "slg"
      t.string   "ops"
      t.string   "woba"

      t.timestamps

    end
  end
end

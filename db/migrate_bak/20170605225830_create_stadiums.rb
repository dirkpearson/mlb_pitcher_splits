class CreateStadiums < ActiveRecord::Migration[5.0]
  def change
    create_table :stadiums do |t|
    t.string   "stadium_name"
    t.string   "park_id"
    t.string   "city"
    t.string   "state"
    t.datetime  "start_date"
    t.datetime  "end_date"
    t.string   "league"
    t.integer   "team_id"

      t.timestamps

    end
  end
end

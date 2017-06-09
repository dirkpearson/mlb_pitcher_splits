class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.integer :stadium_id

      t.timestamps

    end
  end
end

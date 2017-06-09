class CreatePitchers < ActiveRecord::Migration[5.0]
  def change
    create_table :pitchers do |t|
      t.integer :team_id
      t.integer :throws_id
      t.string :first_name
      t.string :last_name
      t.string :pitcher_name

      t.timestamps

    end
  end
end

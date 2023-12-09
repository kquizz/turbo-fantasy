class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.date :start_date
      t.date :end_date
      t.integer :season

      t.timestamps
    end
  end
end

class CreateContestants < ActiveRecord::Migration[7.1]
  def change
    create_table :contestants do |t|
      t.string :name, null: false
      t.date :birth_date
      t.text :description

      t.timestamps
    end
  end
end

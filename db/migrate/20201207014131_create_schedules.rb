class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :name
      t.date :initial_date
      t.integer :number_of_days

      t.timestamps
    end
  end
end

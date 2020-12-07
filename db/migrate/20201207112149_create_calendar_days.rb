class CreateCalendarDays < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_days do |t|
      t.date :my_date

      t.timestamps
    end
  end
end

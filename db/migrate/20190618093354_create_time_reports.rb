class CreateTimeReports < ActiveRecord::Migration[5.2]
  def change
    create_table :time_reports do |t|
      t.integer :played_time
      t.date :played_date
      t.references :small_purpose, foreign_key: true

      t.timestamps
    end
  end
end

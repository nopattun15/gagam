class CreateGrowthReports < ActiveRecord::Migration[5.2]
  def change
    create_table :growth_reports do |t|
      t.integer :amount
      t.integer :count
      t.references :small_purpose, foreign_key: true

      t.timestamps
    end
  end
end

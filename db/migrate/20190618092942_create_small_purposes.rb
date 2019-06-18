class CreateSmallPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :small_purposes do |t|
      t.string :title
      t.date :time_limit
      t.boolean :done
      t.references :big_purpose, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

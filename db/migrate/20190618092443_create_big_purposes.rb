class CreateBigPurposes < ActiveRecord::Migration[5.2]
  def change
    create_table :big_purposes do |t|
      t.string :title
      t.date :time_limit
      t.boolean :done
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

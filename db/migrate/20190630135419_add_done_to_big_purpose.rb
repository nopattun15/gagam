class AddDoneToBigPurpose < ActiveRecord::Migration[5.2]
  def change
    add_column :big_purposes, :done, :boolean, default: false, null: false
  end
end

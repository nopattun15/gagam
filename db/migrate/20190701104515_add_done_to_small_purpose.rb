class AddDoneToSmallPurpose < ActiveRecord::Migration[5.2]
  def change
    add_column :small_purposes, :done, :boolean, default: false, null: false
  end
end

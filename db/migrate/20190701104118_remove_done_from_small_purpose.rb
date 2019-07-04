class RemoveDoneFromSmallPurpose < ActiveRecord::Migration[5.2]
  def change
    remove_column :small_purposes, :done, :boolean
  end
end

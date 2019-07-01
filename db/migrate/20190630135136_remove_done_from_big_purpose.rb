class RemoveDoneFromBigPurpose < ActiveRecord::Migration[5.2]
  def change
    remove_column :big_purposes, :done, :boolean
  end
end

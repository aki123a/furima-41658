class RemoveIsSoldOutFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :is_sold_out, :boolean
  end
end

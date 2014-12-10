class AddCompleteToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :complete, :boolean
  end
end

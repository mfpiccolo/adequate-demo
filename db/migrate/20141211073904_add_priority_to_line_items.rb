class AddPriorityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :priority, :string
  end
end

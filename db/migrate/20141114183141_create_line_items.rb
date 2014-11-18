class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.binary :uuid, limit: 16
      t.integer :invoice_id
      t.text :description
      t.integer :qty
      t.integer :price_cents
      t.integer :total_cents

      t.timestamps
    end
  end
end

class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.binary :uuid, limit: 16
      t.date :date
      t.integer :subtotal_cents
      t.integer :shipping_cents
      t.integer :tax_cents
      t.integer :total_cents
      t.integer :amount_due

      t.timestamps
    end
  end
end

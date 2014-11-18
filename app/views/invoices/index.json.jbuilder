json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :date, :subtotal_cents, :shipping_cents, :tax_cents, :total_cents, :amount_due
  json.url invoice_url(invoice, format: :json)
end

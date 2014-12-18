json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :invoice_id, :description, :qty, :price_cents, :total_cents, :uuid
  json.url line_item_url(line_item, format: :json)
end

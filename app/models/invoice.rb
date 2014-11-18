class Invoice < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  before_validation :calculate

  def calculate
    self.subtotal_cents = line_items.sum(:total_cents)
    self.shipping_cents = 0
    self.tax_cents = 0
    self.total_cents = subtotal_cents + shipping_cents + tax_cents
  end

end

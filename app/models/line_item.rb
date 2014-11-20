class LineItem < ActiveRecord::Base
  belongs_to :invoice
  before_validation :calculate
  after_initialize :finalize

  validates :qty, presence: true, numericality: true
  validates :description, presence: true
  validates :price_cents, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: {greater_than: 0, less_than: 1000000}

  def calculate
    self.total_cents = qty.to_i * price_cents.to_i
  end


  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

  def finalize
    if self.attributes.has_key? "uuid"
      set_uuid
    end
  end
end

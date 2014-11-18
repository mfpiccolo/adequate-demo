class LineItem < ActiveRecord::Base
  belongs_to :invoice
  before_validation :calculate
  after_initialize :finalize

  validates :qty, presence: true

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

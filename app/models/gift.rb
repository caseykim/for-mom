class Gift < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true,
    format: {
      with: /\A\d+(?:\.\d{0,2})?\z/ },
      numericality: {
        greater_than: 0,
        less_than: 500,
        message: "not within Casey's budget :("
    }

  def usd
    ActiveSupport::NumberHelper.number_to_currency(price)
  end
end

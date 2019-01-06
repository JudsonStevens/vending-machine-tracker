class Machine < ApplicationRecord
  belongs_to :owner
  has_many :machine_snack
  has_many :snacks, through: :machine_snacks

  def average_price
    snacks.average(:price)
  end

  def total_count
    snacks.count
  end
end

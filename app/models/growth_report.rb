class GrowthReport < ApplicationRecord
  validates :amount, presence: true, length: { maximum: 5}
  validates :count, presence: true, length: { maximum: 6}
  
  belongs_to :small_purpose
end

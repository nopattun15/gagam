class TimeReport < ApplicationRecord
  validates :played_time, presence: true, length: { maximum: 4}
  validates :played_date, presence: true, length: { maximum: 4}
  
  belongs_to :small_pupose
end

class TimeReport < ApplicationRecord
  validates :played_time, presence: true, length: { maximum: 10}
  validates :played_date, presence: true, length: { maximum: 10}
  
  belongs_to :small_purpose
end

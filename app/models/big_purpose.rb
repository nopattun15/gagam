class BigPurpose < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50}
  validates :time_limit, presence: true, length: { maximum: 10}
  
  belongs_to :user
  
  has_many :small_purposes
end

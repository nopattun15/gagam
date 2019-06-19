class SmallPurpose < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50}
  validates :time_limit, presence: true, length: { maximum: 10}
  
  belongs_to :big_purpose
  belongs_to :user
  
  has_many :time_reports
  has_many :growth_reports
end

class SmallPurpose < ApplicationRecord
  belongs_to :big_purpose
  belongs_to :user
end

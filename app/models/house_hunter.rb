class HouseHunter < ApplicationRecord
  belongs_to :user
  has_one :interest_list
  has_many :inquiries
  belongs_to :house, optional: true

end

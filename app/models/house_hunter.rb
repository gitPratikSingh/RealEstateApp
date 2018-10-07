class HouseHunter < ApplicationRecord
  belongs_to :user
  has_one :interest_list, :dependent => :delete
  has_many :inquiries, dependent: :destroy
  belongs_to :house, optional: true

end

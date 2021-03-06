class House < ApplicationRecord
  has_many :inquiries,  dependent: :destroy
  belongs_to :interest_list, optional: true
  has_many :house_hunters

  has_one :potential_buyers_list, dependent: :destroy
  belongs_to :real_estate_company
  belongs_to :realtor, optional: true
  validates :location, presence: true
  validates :square_footage, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :year_built,  length: { is: 4 }, :numericality => { :greater_than_or_equal_to => 0 }
  validates :style, presence: true
  validates :list_price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :num_of_floors, :numericality => { :greater_than_or_equal_to => 1 }

  validates :current_owner, presence: true

  has_many_attached :images
end

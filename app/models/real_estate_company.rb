require 'uri'

class RealEstateCompany < ApplicationRecord
  has_many :realtors
  has_many :houses, dependent: :destroy
  validates :name, presence: true
  validates :website, format: { with: URI::regexp(%w(http https)), :message => "Invalid URL. Please provide a valid URL like https://www.google.com or http://www.google.com"}
  validates :address, presence: true
  validates :size, presence: true
  validates :founded, presence: true, numericality: true
  validates :revenue, presence: true, numericality: true
  validates :synopsis, presence: true
end

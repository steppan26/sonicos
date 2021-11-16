class Costume < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, :location, presence: true
  validates :title, length: { minimum: 5, maximum: 60 }
  validates :price, numericality: true
end

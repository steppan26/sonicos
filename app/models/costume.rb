class Costume < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy

  validates :title, :image_url, :price, :location, presence: true
  validates :title, length: { minimum: 5, maximum: 60 }
end

class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  validates :date_of_hire, :duration, presence: true
  validates :duration, numericality: { only_integer: true }
  validates :status, inclusion: ['pending', 'accepted', 'rejected']

  def date_of_end
    date_of_hire + duration
  end
end

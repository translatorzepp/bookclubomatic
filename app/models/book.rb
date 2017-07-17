class Book < ApplicationRecord
  validates :title, presence: true
  has_many :votes, dependent: :destroy
end

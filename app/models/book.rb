class Book < ApplicationRecord
  has_many :votes, dependent: :destroy
end

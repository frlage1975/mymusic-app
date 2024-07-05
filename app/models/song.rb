class Song < ApplicationRecord
  has_and_belongs_to_many :albums

  validates :title, presence: true
end

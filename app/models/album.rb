class Album < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :songs

  validates :title, presence: true, uniqueness: true
end

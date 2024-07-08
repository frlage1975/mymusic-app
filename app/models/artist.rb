class Artist < ApplicationRecord
  belongs_to :country
  has_and_belongs_to_many :albums

  validates :name, presence: true, uniqueness: true
end

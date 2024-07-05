class Country < ApplicationRecord
  has_many :artists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end

class List < ApplicationRecord
  has_one_attached :photo
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end

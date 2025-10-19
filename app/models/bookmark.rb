class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: { minimum: 6 }, on: :update
  validates :movie, presence: true
  validates :list, presence: true

  validates :movie_id, uniqueness: { scope: :list_id, message: "ya está agregado a esta lista" }
end

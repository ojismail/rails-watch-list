class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  validates :title, :overview, presence: true
  validates :title, uniqueness: { scope: :overview }

  before_destroy :check_for_bookmarks

  private

  def check_for_bookmarks
    if bookmarks.any?
      errors.add(:base, 'Cannot delete movie with associated bookmarks')
      throw :abort
    end
  end
end

class Movie < ApplicationRecord
  before_destroy :check_for_bookmarks

  has_many :bookmarks, dependent: :destroy

  validates :title, :overview, presence: true
  validates :title, uniqueness: { scope: :overview }

  private

  def check_for_bookmarks
    if bookmarks.any?
      raise ActiveRecord::InvalidForeignKey.new('Cannot delete movie with associated bookmarks')
    end
  end
end

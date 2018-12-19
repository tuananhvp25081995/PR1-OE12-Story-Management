class Author < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :member

  validates :name, presence: true, length: {maximum: Settings.Author.name.maximum}
end

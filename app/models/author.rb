class Author < ApplicationRecord
  has_many :stories, dependent: :destroy
  belongs_to :member

  validates :name, presence: true, length: {maximum: Settings.Author.name.maximum}
  scope :order_by, ->(direction){order created_at: direction}
end

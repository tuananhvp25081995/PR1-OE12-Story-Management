class Comment < ApplicationRecord
  belongs_to :story
  belongs_to :member
  validates :content, presence: true, length: {maximum: Settings.Comment.content}

  scope :by_order, ->{order created_at: :desc}
  delegate :name, to: :member, prefix: true
end

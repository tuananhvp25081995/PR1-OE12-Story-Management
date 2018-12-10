class Story < ApplicationRecord
  belongs_to :author
  belongs_to :member
  has_many :category_stories
  has_many :categories, through: :category_stories
  has_many :follows
  has_many :members, through: :follows
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.Story.name.maximum}
  validates :image, presence: true, length: {maximum: Settings.Story.image.maximum}
  validates :describe, presence: true, length: {minimum: Settings.Story.describe.minimum}
  validates :author_id, :member_id, presence: true
  scope :filter, -> (type){where name: type}

  delegate :name, to: :author, prefix: true


  def follow_unfolow member_id
    result = Follow.find_by(story_id: id, member_id: member_id)
    if result
      result.destroy
      return nil
    else
      result = Follow.create(story_id: id, member_id: member_id)
    end
  end

  def self.search_by search_term
    where("LOWER(name) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end
end

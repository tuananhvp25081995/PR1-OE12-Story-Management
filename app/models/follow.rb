class Follow < ApplicationRecord
  belongs_to :story
  belongs_to :member
end

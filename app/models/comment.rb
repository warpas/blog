class Comment < ApplicationRecord
  validates :commenter_name, presence: true
  validates :content, presence: true
  validates :post_id, presence: true
end

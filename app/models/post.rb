class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 500 }
  validates :user_id, presence: true
  
   default_scope order: 'posts.created_at DESC'
end

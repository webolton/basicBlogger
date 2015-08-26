class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :favorites
  has_many :sub_posts, class_name: 'Post', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Post'

  validates :body, presence: true
  validates :user_id, presence: true

  scope :is_popular, -> {
    joins(:favorites).group(:posts).having("COUNT(*) > 3")
  }
end

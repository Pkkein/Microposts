class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
  validates :content, presence: true, length: { maximum: 255 }
  
  def like(user)
    unless self.user.id == user.id
      self.likes.find_or_create_by(user_id: user.id)
    end
  end
  
  def unlike(user)
    like = self.likes.find_by(user_id: user.id)
    like.destroy if like
  end
  
end

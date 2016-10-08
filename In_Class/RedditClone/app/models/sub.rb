class Sub < ActiveRecord::Base
  validates :moderator_id, presence: true, uniqueness: {scope: :title}
  validates :title, :description, presence: true

  belongs_to :moderator,
  class_name: :User
  has_many :posts, through: :post_subs, source: :post
  has_many :post_subs, inverse_of: :sub
end

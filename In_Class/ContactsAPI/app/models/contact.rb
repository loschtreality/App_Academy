class Contact < ActiveRecord::Base
  validates :email, uniqueness: { scope: :user_id }
  validates :user_id, :email, presence: true
  has_many :contact_shares
  has_many :shared_users, through: :contact_shares, source: :user
  belongs_to :user
  has_many :comments_about, as: :commentee, class_name: :Comment
end

class User < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy
  has_many :shared_contacts, through: :contact_shares, source: :contact
  has_many :comments_about, as: :commentee, class_name: :Comment
  has_many :authored_comments, foreign_key: :author_id, class_name: :Comment
end

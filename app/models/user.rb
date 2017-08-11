class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true
  has_many :tasks, dependent: :delete_all
  has_secure_password
  validates_uniqueness_of :email

end

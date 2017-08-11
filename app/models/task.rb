class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :hour, presence: true
  validates :minute, presence: true
  validates :importance, presence: true
  validates :user_id, presence: true
  belongs_to :user
end

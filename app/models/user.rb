class User < ApplicationRecord
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  has_and_belongs_to_many :events, join_table: 'events_users'
  has_many :organized_events, class_name: 'Event', dependent: :destroy, foreign_key: 'organizer_id'

end

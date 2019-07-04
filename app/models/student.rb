class Student < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {minimum: 5, maximum: 25}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 100}, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  has_many :student_courses
  has_many :courses, through: :student_courses
end

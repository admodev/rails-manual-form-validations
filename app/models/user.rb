class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: { case_sensitive: true }, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Only letters and numbers are allowed." }
end


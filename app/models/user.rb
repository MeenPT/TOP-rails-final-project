class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_save :create_profile

  has_one :profile

  validates :username, presence: true, uniqueness: true

  private
    def create_profile
      create_profile!(display_name: username)
    end
end

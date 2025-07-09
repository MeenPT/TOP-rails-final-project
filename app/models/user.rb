class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_profile

  has_one :profile, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  private
    def create_profile
      Profile.create(display_name: username, user_id: id)
    end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable

  has_many :contributors, dependent: :destroy
  has_many :shelves, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  before_save :ensure_authentication_token

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def reset_auth_token
    update(authentication_token: nil)
  end
end

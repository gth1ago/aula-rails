class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presente: true, length: {in: 7..30}
  validates :password, presence: true, length: {in: 5..50}
  has_many :tarefas, dependent: :destroy
end

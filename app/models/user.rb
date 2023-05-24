class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, presence: true, inclusion: { in: ["Invitado", "Mesero", "Chef", "Admin"], message: "debe ser uno de: Invitado, Mesero, Chef o Admin" }
end

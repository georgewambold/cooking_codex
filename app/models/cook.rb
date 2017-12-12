class Cook < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :trackable, :lockable, :timeoutable, :omniauthable, :registerable
  devise :database_authenticatable, :recoverable, :rememberable,
    :validatable
end

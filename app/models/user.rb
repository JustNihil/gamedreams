class User < ApplicationRecord 
       has_and_belongs_to_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable

         validates :first_name, :last_name, presence: true, length: { maximum: 100, minimum: 3 }
         validates :email, email: {mode: :strict}, length: { maximum: 150, minimum: 7 }

         def admin?
              writing == "admin"
            end
end

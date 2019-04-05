class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role
  has_many :items
  
  validates_presence_of :name
before_save :assign_role

def assign_role
  self.role = Role.find_by name: "Regular" if self.role.nil?
end
end

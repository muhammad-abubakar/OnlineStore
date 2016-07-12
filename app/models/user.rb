class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role


  has_many :line_items
  has_many :products,  dependent: :destroy


  validates_presence_of :name
  
  before_save :assign_role

  def assign_role
    role = Role.find_by name: Role::USER if self.role.nil?
  end

  def admin?
    role.try(:name) == Role::ADMIN
  end

  def user?
    role.try(:name) == Role::ADMIN 
  end

  def guest?
    role.nil? || role.name == Role::GUEST
  end
end

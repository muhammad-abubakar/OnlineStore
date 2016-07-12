class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role


  has_many :line_items
  has_many :products,  dependent: :destroy


  validates_presence_of :name
  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: Role::USER if self.role.nil?
  end

  def admin?
    self.role.name == Role::ADMIN
  end

  def guest?
    self.role.name == Role::GUEST
  end
end

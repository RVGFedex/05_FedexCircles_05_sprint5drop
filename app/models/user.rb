class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  belongs_to :circle
  validates_presence_of :name
  
  before_save :assign_defaults
  
  def assign_defaults
    self.role = Role.find_by name: "Customer" if self.role.nil?
	self.circle = Circle.find_by name: "Empty Circle" if self.circle.nil?
  end
end

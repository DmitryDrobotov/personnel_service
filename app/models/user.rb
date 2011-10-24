class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :position
  
  has_many :incoming_treatments, :class_name => "Treatment", :foreign_key => "user_to_id"
  has_many :outgoing_treatments, :class_name => "Treatment", :foreign_key => "user_from_id"
  
  belongs_to :chief, :class_name => "User"
  has_many :chiefs, :class_name => "User", :foreign_key => "chief_id"

  has_many :activities
  has_many :events, :through =>  :activities

  before_create :set_default_role

  def set_default_role
    self.role ||= "employee"
  end

  def set_default_password
    self.password ||= "123456"
  end

  def full_name
    self.first_name + " " + self.last_name
  end

end
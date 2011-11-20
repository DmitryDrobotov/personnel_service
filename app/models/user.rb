class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :position

  User::AVAILABLE_ROLES = ["admin", "manager", "training-manager", "employee"]

  has_many :incoming_treatments, :class_name => "Treatment", :foreign_key => "user_to_id"
  has_many :outgoing_treatments, :class_name => "Treatment", :foreign_key => "user_from_id"
  
  belongs_to :chief, :class_name => "User"
  has_many :chiefs, :class_name => "User", :foreign_key => "chief_id"

  has_many :activities
  has_many :events, :through =>  :activities

  before_validation :set_default_role
  before_validation :set_default_password

  validates :last_name, :first_name, :presence => true
  validate :validate_role

  def full_name
    self.first_name + " " + self.last_name
  end

  private

  def validate_role
    unless User::AVAILABLE_ROLES.include? self.role
      errors.add(:role, "only can be one of #{User::AVAILABLE_ROLES}")
    end
  end

  def set_default_role
    self.role ||= "employee"
  end

  def set_default_password
    self.password ||= "123456"
  end

end
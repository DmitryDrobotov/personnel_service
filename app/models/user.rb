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
  has_many :events, :through => :activities

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

end # == Schema Information
    #
    # Table name: users
    #
    #  id                     :integer(4)      not null, primary key
    #  email                  :string(255)     default(""), not null
    #  encrypted_password     :string(128)     default(""), not null
    #  reset_password_token   :string(255)
    #  reset_password_sent_at :datetime
    #  remember_created_at    :datetime
    #  sign_in_count          :integer(4)      default(0)
    #  current_sign_in_at     :datetime
    #  last_sign_in_at        :datetime
    #  current_sign_in_ip     :string(255)
    #  last_sign_in_ip        :string(255)
    #  first_name             :string(255)
    #  last_name              :string(255)
    #  position_id            :integer(4)
    #  chief_id               :integer(4)
    #  created_at             :datetime
    #  updated_at             :datetime
    #  role                   :string(255)     default("employee")
    #


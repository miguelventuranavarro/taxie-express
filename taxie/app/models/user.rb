class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_type

  before_create :set_default_user_type

  has_many :reservations

  private
  def set_default_user_type
    self.user_type ||= UserType.find_by_id('1')
  end
         
end

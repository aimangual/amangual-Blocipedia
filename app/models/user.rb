class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  after_initialize :default_role
         
  enum role: [:standard, :moderator, :premium, :admin]

  def default_role
    role ||= :standard
  end
end

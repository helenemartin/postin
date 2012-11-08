class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :avatar, :username

  # attr_accessible :title, :body

  validates :username, :uniqueness => true,:length => { :within => 4..12 }
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end

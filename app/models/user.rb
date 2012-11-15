class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, 
  :uid, :post_attributes, :avatar, :username, :name, :bio

  # attr_accessible :title, :body

  validates :username, :uniqueness => true
  has_many :posts, dependent: :destroy

  has_attached_file :avatar,  
                  :url  => "/assets/profiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"
                  # :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def to_param
    username
  end
end

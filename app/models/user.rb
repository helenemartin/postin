class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


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
                  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension",
                  :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def to_param
    username
  end
end

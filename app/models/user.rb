class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, authentication_keys: [:login, :domain_id]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me, :provider, 
  :uid, :post_attributes, :avatar, :username, :name, :bio

  validates :username, :uniqueness => true
  has_many :posts, dependent: :destroy

  has_attached_file :avatar,  
                  :url  => "/assets/profiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"
                  # :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # after_create :send_out_sign_up_email

  def to_param
    username
  end

  # def send_out_sign_up_email
    # UserMailer.sign_up_email(self).deliver
  # end

end

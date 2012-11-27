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
  :uid, :post_attributes, :avatar, :username, :name, :bio, :showreel

  validates :username, :uniqueness => true
  has_many :posts, dependent: :destroy

  has_attached_file :avatar,  
                  :url  => "/assets/profiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension",
                  :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # after_create :send_out_sign_up_email

  has_many :favourites

  def to_param
    username
  end

  # def send_out_sign_up_email
    # UserMailer.sign_up_email(self).deliver
  # end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.twitter_data"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end


end

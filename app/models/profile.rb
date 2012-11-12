class Profile < ActiveRecord::Base
  attr_accessible :username, :avatar

  validates :username, :uniqueness => true
  # validates :avatar, :attachment_presence => true	

  belongs_to :user

  has_attached_file :avatar,  
                  :url  => "/assets/profiles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension",
                  :styles => { :medium => "300x300>", :thumb => "100x100>" }

# validates_attachment_presence :avatar
# validates_attachment_size :avatar, :less_than => 5.megabytes
# validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'],
  # :message => 'must be a JPEG, GIF or PNG image',
  # :if => Profile.new { |profile| profile.avatar.file? }

  acts_as_url :profile  

  def to_param
    if username.present?
      username
    else
      id
    end
  end
	

end

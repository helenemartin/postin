class Profile < ActiveRecord::Base
  attr_accessible :username, :avatar

  validates :username, :uniqueness => true
  validates :avatar, :attachment_presence => true

  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  

end

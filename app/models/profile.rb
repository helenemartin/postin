class Profile < ActiveRecord::Base
  attr_accessible :username, :avatar

  belongs_to :user



end

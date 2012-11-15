class Post < ActiveRecord::Base
  attr_accessible :author, :domain, :embed_code, :link, :media_provider, :media_type,
   :meta_tags, :thumbnail_url, :user_id, :profile_attributes, :url, :title

belongs_to :user

acts_as_url :title

def to_param
    if url.present?
      url
    else
      id
    end
end 

end

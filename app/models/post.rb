class Post < ActiveRecord::Base
  attr_accessible :author, :domain, :embed_code, :link, :media_provider, :media_type, :meta_tags, :thumbnail_url, :user_id
end

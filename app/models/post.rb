class Post < ActiveRecord::Base
  attr_accessible :author, :domain, :embed_code, :link, :media_provider, :media_type,
   :meta_tags, :thumbnail_url, :user_id, :profile_attributes, :url, :title, :description

  belongs_to :user
  has_many :favourites

  #acts_as_commentable

  paginates_per 3
  default_scope order("created_at DESC")  

  before_validation :get_embedly
  acts_as_url :title

  def to_param
      if url.present?
        url
      else
        id
      end
  end 


  require 'embedly'
  require 'json'

  def get_embedly
    embedly_api = Embedly::API.new :key => 'd71f38d2305e11e1b6634040d3dc5c07', :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'
    obj = embedly_api.oembed url: self.link
    logger.info obj
    self.thumbnail_url = obj[0].thumbnail_url
    self.title = obj[0].title
    self.embed_code = obj[0].html
    self.media_provider = obj[0].provider_name
    self.media_type = obj[0].rich
    self.description = obj[0].description
    # self.meta_tags = obj[0].title
    # self.description = obj[0].description - requires a migration

  end


end

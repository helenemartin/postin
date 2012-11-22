class FavouritesController < ApplicationController

  def index
    @favourites = current_user.favourites.all(:order => "created_at ASC")
  end

  def create
  	post = Post.find(params[:post_id])
    current_user.favourites << Favourite.new(post_id: post.id)

    respond_to do |format|
      format.html { redirect_to post_url(post) }
      format.json { head :no_content }
    end
  end

  def destroy
    @favourite = current_user.favourites.find_by_post_id(params[:id])
    @favourite.destroy unless @favourite.blank?

    respond_to do |format|
      format.html { redirect_to @post_url }
      format.json { head :no_content }
    end
  end

end

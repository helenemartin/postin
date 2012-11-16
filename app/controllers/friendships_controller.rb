class FriendshipsController < ApplicationController
 
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    respond_to do |format|
      if @friendship.save

        flash[:notice] = "Followed"
        redirect_to root_url
        # format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        # format.json { render json: @friendship, status: :created, location: @friendship }
      else

        flash[:error] = "Unable to Follow"
        redirect_to root_url
        # format.html { render action: "new" }
        # format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Un followed"
    redirect_to current_user

    # respond_to do |format|
    #   format.html { redirect_to friendships_url }
    #   format.json { head :no_content }
    # end
  end
end

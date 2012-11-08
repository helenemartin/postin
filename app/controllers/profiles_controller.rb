class ProfilesController < ApplicationController

	def show
    # @profile = current_user.profile
    # or maybe this way, not sure how you have your relations set up
    @profile = Profile.find(params[:id])
  	end

  def new
    super
    @user.profile = Profile.new
  end

  def create
    super
    @profile = @user.profiles.build(params[:profile])
      if @profile.save
      flash[:notice] = "Profile written"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end



end
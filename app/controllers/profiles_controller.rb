class ProfilesController < ApplicationController

  before_filter :get_profile, only: [
  :show, :edit, :update
  ]

	def show
    # @profile = current_user.profile
    # or maybe this way, not sure how you have your relations set up
    # @profile = Profile.find(params[:id]) #removed for before filter
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

  def edit
    # @profile = current_user.profile
    # or maybe this way, not sure how you have your relations set up
    # @profile = Profile.find(params[:id]) #removed for before filter
  end

  def update
    # @profile = Profile.find(params[:id]) #removed for before filter

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def get_profile
    @profile = Profile.find_by_username(params[:id])
  end


end
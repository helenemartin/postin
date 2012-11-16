class UsersController < ApplicationController

  before_filter :get_user, only: [
  :show, :edit, :update
  ]


	def show
    # @profile = current_user.profile
    # or maybe this way, not sure how you have your relations set up
    # @profile = Profile.find(params[:id]) #removed for before filter
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.save
      flash[:notice] = "Profile written"
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def edit
    # @user = current_user
    # or maybe this way, not sure how you have your relations set up
    # @profile = Profile.find(params[:id]) #removed for before filter
  end

  def update
    # @profile = Profile.find(params[:id]) #removed for before filter

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end 
  end

  private

  def get_user
    @user = User.find_by_username!(params[:id])
  end


end
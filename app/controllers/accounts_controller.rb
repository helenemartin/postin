class AccountsController < ApplicationController
  def edit

  	@user = current_user

  end

  def update
  	@user = current_user

  	
  	if @user.update_attributes(params[:user])
  		flash[:alert] = "Account updated!"
  	end

  	render "edit"

  end
end

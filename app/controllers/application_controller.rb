class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :which_layout

  def which_layout
  	if current_user.present?
  		"logged_in"
  	else
  		"application"
  	end
  end
end

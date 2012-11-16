class PostStepsController < ApplicationController
	include Wicked::Wizard

	steps :meta_data


	def show
		@post = Post.new(params[:post])
		render_wizard
	end

	def update
		@post = Post.new(params[:post])
		@post.attributes = params[:post]
		render_wizard @post
	end

	private 

	def redirect_to_finish_wizard
		redirect_to root_url, notice: "Posetd!"
	end
end

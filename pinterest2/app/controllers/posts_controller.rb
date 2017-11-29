class PostsController < ApplicationController
	before_action :set_post, except:[:new,:create,:index]

	def index
	end





	def index

		@array_of_posts = Post.all


	end

	def show 

	end

	def new

		@new_post = Post.new
	end


	def create



		@new_post = current_user.posts.new(post_params)



		if @new_post.save
			redirect_to @new_post

		else
			render :new
		end


		
	end

	def delete
		@array_of_posts = post.all
	end

	def destroy
		@new_post.destroy
		redirect_to posts_path
	end

	def edit
		render :edit
	end

	def update
		if @new_post.update(post_params)
			redirect_to @new_post
		else
			render :edit
		end
	end

	#STRONG_PARAM

	private

	def post_params
		params.require(:post).permit(:title, :body,:image)
	end


	def set_post
		@new_post = Post.find(params[:id])
end
end

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
     @post = Post.find(like_params)

    if !@post
      redirect_to posts_path, alert: "Post not found"
    end

    @like = @post.likes.new(user: current_user)

    respond_to do |format|
      if @like.save
        format.html { redirect_to posts_path, notice: "Liked post" }
        format.turbo_stream
      else
        format.html { flash.now[:alert] = "Something went wrong" }
      end
     end
  end

  def destroy
    @like = current_user.likes.find(params[:id])

    if !@like
      redirect_to posts_path, alert: "Post not found"
    end

    @post = @like.post

    @like.destroy!

    response do |format|
      format.html { flash.now[:notice] = "Unliked  post" }
      format.turbo_stream
    end
  end

  private
    def like_params
      params.require(:post_id)
    end
end

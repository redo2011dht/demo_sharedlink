class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

   def like
    @post=Post.find(params[:post_id])
   # @like = @post.likes.build()
   @like=Like.find(params[:like_id])
    @like.user=current_user
    @like.status=true
    @post.likenumber=@post.likenumber.to_i+1
    @like.save
    redirect_to posts_url
  end

  def unlike
    @post=Post.find(params[:post_id])
    #@like=@post.likes.build()
    @like.user_id=current_user.id
    @like.status=false
    @post.likenumber =  @post.likenumber.to_i - 1 
    @like.save
    redirect_to posts_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:post_id)
    end
end

class LikesController < ApplicationController
 # before_action :authenticate_user!,only: [:s
  before_action :set_like, only: [:show, :edit, :update, :destroy]
   def index
    like = Like.where({user_id: current_user.id, post_id: params[:post_id]}).first_or_create(:status => false)
    like.status = !like.status
    like.save

    post=Post.find_by_id(params[:post_id])
    if like.status
      session[:like]=true
      post.likenumber+=1
    else
      post.likenumber-=1
      session[:like]=false
    end
    post.save
    redirect_to :back
  end
  private 
  def likes_params
    params.require(:like).permit(:status)
  end
end

class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    #binding.pry
    postl = Micropost.find(params[:micropost_id])
    postl.like(current_user)
    flash[:success] = 'お気に入りに登録しました。'
    redirect_to root_url
  end

  def destroy
    postl = Micropost.find(params[:micropost_id])
    postl.unlike(current_user)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end

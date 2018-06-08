class LikesController < ApplicationController
  before_action :find_article
  before_action :find_like, only: [:destroy]

  def create
    @article.likes.create(user_id: current_user.id) if !already_liked?
    redirect_to URI(request.referer).path
  end

  def destroy
    @like.destroy if already_liked?
    redirect_to URI(request.referer).path
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_like
    @like = @article.likes.find(params[:id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, article_id: params[:article_id]).exists?
  end
end

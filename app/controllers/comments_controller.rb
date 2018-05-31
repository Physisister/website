class CommentsController < ApplicationController
  before_action :find_article

  def create
    @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params[:comment].permit(:content).merge(user_id: current_user.id)
  end

end

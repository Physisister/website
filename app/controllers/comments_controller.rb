class CommentsController < ApplicationController
  before_action :find_article
  before_action :find_comment, only: [:destroy]

  def create
    @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment.destroy unless not_their_comment
    redirect_to article_path(@article)
  end

  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = @article.comments.find(params[:id])
  end

  def comment_params
    params[:comment].permit(:content).merge(user_id: current_user.id)
  end

  def not_their_comment
    @comment.user_id != current_user.id
  end

end

class RepliesController < ApplicationController
  before_action :find_article
  before_action :find_comment
  before_action :find_reply, only: [:destroy]

  def create
    @comment.replies.create(reply_params)
    redirect_to article_path(@article)
  end

  def destroy
    @reply.destroy unless not_their_reply
    redirect_to article_path(@article)
  end


  private

  def find_article
    @article = Article.find(params[:article_id])
  end

  def find_comment
    @comment = @article.comments.find(params[:comment_id])
  end

  def find_reply
    @reply = @comment.replies.find(params[:id])
  end

  def reply_params
    params[:reply].permit(:content).merge(user_id: current_user.id)
  end

  def not_their_reply
    @reply.user_id != current_user.id
  end

end

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if !current_user.write_access?
      flash.now[:notice] = "You don't have permission to post articles"
      render 'new'
    elsif @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if not_their_article
      flash.now[:notice] = "This is not your article"
      render 'edit'
    elsif @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy unless not_their_article
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private

    def article_params
      params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
    end

    def find_article
      @article = Article.find(params[:id])
    end

    def not_their_article
      @article.user_id != current_user.id
    end
end

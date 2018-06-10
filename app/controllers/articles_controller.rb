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
    if @article.save
      redirect_to @article
    else
      flash.now[:notice] = "Every blog needs a title and some text"
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
      flash.now[:notice] = "Every blog needs a title and some text"
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

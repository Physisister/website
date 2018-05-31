class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
  end

  def edit
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      flash.now[:notice] = "Every blog needs a title and some text"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
    end
end

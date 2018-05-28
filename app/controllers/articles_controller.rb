class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Your article has been saved"
      redirect_to @article
    else
      flash.now[:notice] = "Every blog needs a title and some text"
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

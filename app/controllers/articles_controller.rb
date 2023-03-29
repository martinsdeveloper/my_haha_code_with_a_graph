class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy, :download_file]

  def new
    @article = Article.new
  end

  def show; end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to article_path(id: @article.id)
  end

  def index
    @articles = Article.all
  end

  def create
    article = Article.create(article_params)
    article.image.attach(params[:article][:image])
    redirect_to article
  end

  def download_file
    @article = Article.find(params[:id])
    send_data @article.image, filename: @article.title
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def get_article
    @article = Article.find(params[:id])
  end
end
class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # fail - use it to check the request
    @article = Article.new(article_params)
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end
end

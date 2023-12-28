class Api::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
    render json: {"articles": @articles, 'articlesCount': @articles.count}
  end

  def show
  end

  def new
    @article = Article.new
    @tags = Tag.all
  end

  def edit
  end

  def create
    @article = Article.new(article_params.except(:tagList))
    if @article.save
      @article.tags = self.create_tag(article_params[:tagList])
      render_article()
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.new(article_params.except(:tagList))
    if @article.update(article_params)
      @article.tags = self.create_tag(article_params[:tagList])
      render_article()
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id])
      @tags = Tag.all
    end

    def article_params
      params.require(:article).permit(:title, :body, :description, :user_id, tagList: [])
    end

    def create_tag(tags)
      list = []
      tags.each do |name|
        tag = Tag.find_or_create_by(name:name)
        list << tag
      end
      return list
    end

    def render_article
      render json: { article: @article.render_json }
    end
  
end

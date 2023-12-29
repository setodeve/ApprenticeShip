class Api::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    list = []
    if params[:author]
      @articles = Article.fitler_by_user(params[:author])
    elsif params[:tag]
      @articles = Article.fitler_by_tag(params[:tag])
    else
      @articles = Article.all
    end
    @articles.each do |a|
      list << a.render_json
    end
    render json: {"articles": list, 'articlesCount': @articles.count}
  end

  def show
    render_article()
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params.except(:tagList))
    @article.slug = @article.title.parameterize+"-"+String(@article.id)
    if @article.save
      @article.tags = self.create_tag(article_params[:tagList])if !(article_params[:tagList].nil?)
      render_article()
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    @article.slug = @article.title.parameterize+"-"+String(@article.id)
    if @article.update(article_params)
      @article.tags = self.create_tag(article_params[:tagList]) if !(article_params[:tagList].nil?)
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
      @article = Article.find_by(slug:params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :slug, :body, :description, :user_id, tagList: [])
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

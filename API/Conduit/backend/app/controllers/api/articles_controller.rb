class Api::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :check_current_user, except: %i[ index show ]

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
    if !@current_user
      render json: {}, status: 401
    else
      @article = Article.new
    end
  end

  def edit
    if !@current_user && (@current_user.id == @article.user_id) 
      render json: {}, status: 401
    else
      render_article()
    end
  end

  def create
    if !@current_user
      render json: {}, status: 401
    else
      @article = Article.create(article_params.except(:tagList))
      create_slug()
      if @article.save
        @article.tags = self.create_tag(article_params[:tagList]) if !(article_params[:tagList].nil?)
        render_article()
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if !@current_user && (@current_user.id == @article.user_id) 
      render json: {}, status: 401
    else
      create_slug()
      if @article.update(article_params)
        @article.tags = self.create_tag(article_params[:tagList]) if !(article_params[:tagList].nil?)
        render_article()
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if !@current_user && (@current_user.id == @article.user_id) 
      render json: {}, status: 401
    else
      @article.destroy
    end
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
  
    def create_slug
      @article.slug = @article.title.gsub(" ","-")+"-"+String(@article.id)
    end
end

class Api::ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  def index
    @articles = Article.all
    @tags = Tag.limit(5)
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
    @article = Article.new(article_params)
    @tags = Tag.all
    create_tag()
    respond_to do |format|
      if @article.save
        render status: :created, location: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    create_tag()
      if @article.update(article_params)
        render status: :ok
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
      @user = User.find(@article.user_id)
      @tags = Tag.all
    end

    def article_params
      params.require(:article).permit(:title, :content, :user_id,  tagList: [])
    end

    def create_tag
      params[:tagList].each do |name|
        Tag.create!(name:name) if(!Tag.exists?(name:name))
      end
    end
end

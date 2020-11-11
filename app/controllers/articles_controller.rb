class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :move_to_new, only: [:edit, :show]


  def index
    @article = Article.includes(:user).order('created_at DESC')
    @news_store = NewsStore.where(category: 'all').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
     @article = Article.find(params[:id])
     @favorite = Favorite.new
  end

  def edit
    @article = Article.find(params[:id])
    redirect_to root_path unless current_user.id == @article.user_id
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      @article.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  def move_to_new
    redirect_to action: :new unless user_signed_in?
  end

  def business
    @news_store = NewsStore.where(category: 'business').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end

  def science
    @news_store = NewsStore.where(category: 'science').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end

  def technology
    @news_store = NewsStore.where(category: 'technology').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end


  private
  def article_params
    params.require(:article).permit(:title, :description, :category_id, :image).merge(user_id: current_user.id)
  end
  
end

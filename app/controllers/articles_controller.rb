class ArticlesController < ApplicationController
  def index
    @article = Article.includes(:user).order('created_at DESC')
    # .page(params[:page]).per(1)

    # news_api_key=ENV["NEWS_API_KEY"]
    # url = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
    # response = Net::HTTP.get(url)
    # @moments = JSON.parse(response)
    # @data = @moments['articles']
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


  def business
    # news_api_key=ENV["NEWS_API_KEY"]
    # uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=#{news_api_key}")
    # responses = Net::HTTP.get(uri)
    # @moment = JSON.parse(responses)
    # @datas = @moment['articles']
    @news_store = NewsStore.where(category: 'business').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end

  def science
    # news_api_key=ENV["NEWS_API_KEY"]
    # uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=science&apiKey=#{news_api_key}") #news_API
    # responses = Net::HTTP.get(uri)
    # @moment = JSON.parse(responses)
    # @datas = @moment['articles']
    @news_store = NewsStore.where(category: 'science').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end

  def technology
    # news_api_key=ENV["NEWS_API_KEY"]
    # uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=#{news_api_key}") #news_API
    # responses = Net::HTTP.get(uri)
    # @moment = JSON.parse(responses)
    # @datas = @moment['articles']
    @news_store = NewsStore.where(category: 'technology').order("created_at DESC").page(params[:page]).per(8).where.not(urlToImage: false)
  end


  private
  def article_params
    # params.require(:article).permit(:title, :description, :category_id, :image).merge(user_id: current_user.id)
    params.require(:article).permit(:title, :description, :category_id, :image).merge(user_id: current_user.id)
  end
  
end

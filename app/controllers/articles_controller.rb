class ArticlesController < ApplicationController
  def index
    @article = Article.includes(:user).order('created_at DESC')

    news_api_key=ENV["NEWS_API_KEY"]
    url = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
    response = Net::HTTP.get(url)
    @moments = JSON.parse(response)
    @data = @moments['articles']
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
  end

  def business
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=#{news_api_key}")
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
  end

  def science
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=science&apiKey=#{news_api_key}") #news_API
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    #  binding.pry
  end

  def technology
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=#{news_api_key}") #news_API
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
  end


  private
  def article_params
    params.require(:article).permit(:title, :description, :category_id, :image).merge(user_id: current_user.id)
  end
  
end

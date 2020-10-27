class ArticlesController < ApplicationController
  def index
    @article = Article.includes(:user).order('created_at DESC')

    news_api_key=ENV["NEWS_API_KEY"]
    url = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
    response = Net::HTTP.get(url)
    @moments = JSON.parse(response)
    @data = @moments['articles']
    # binding.pry
    #  uri = URI.parse('http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=ENV["NEWS_API_KEY"]')
    #  responses = Net::HTTP.get(uri)
    #  @moment = JSON.parse(responses)
    #  @datas = @moment['articles']
  end
  # class ArticlesController < NewsController
  #   def news
  #     # 親のindexを呼び出す
  #     public_method(:index).super_method.call
  #   end
  # end

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
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=#{news_api_key}")
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    #  uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=' + @genre + '&apiKey=ENV["NEWS_API_KEY"]') #news_API
    #  responses = Net::HTTP.get(uri)
    #  @moment = JSON.parse(responses)
    #  @datas = @moment['articles']
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

class ArticlesController < ApplicationController
  def index
    @user = User.all
    url = URI.parse('http://newsapi.org/v2/top-headlines?country=jp&apiKey=ENV["NEWS_API_KEY"]')
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

  def show
    uri = URI.parse('http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=ENV["NEWS_API_KEY"]')
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    #  uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=' + @genre + '&apiKey=ENV["NEWS_API_KEY"]') #news_API
    #  responses = Net::HTTP.get(uri)
    #  @moment = JSON.parse(responses)
    #  @datas = @moment['articles']
    #       binding.pry
  end
end

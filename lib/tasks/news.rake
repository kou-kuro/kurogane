namespace :news do 
  desc "news"
  task news_save_box: :environment do

    NewsStore.order("created_at: :desc")
    news_api_key=ENV["NEWS_API_KEY"]
    url = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
    response = Net::HTTP.get(url)
    @moments = JSON.parse(response)
    @data = @moments['articles']
    @data[0..9].each do |data|
      @news_store = NewsStore.new
      @news_store.title = data["title"]
      @news_store.url = data["url"]
      @news_store.description = data["description"]
      @news_store.category = "all"
      @news_store.urlToImage = data["urlToImage"]
      @news_store.save
    end
    
    NewsStore.order("created_at: :desc")
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=#{news_api_key}")
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    @datas[0..9].each do |datas|
      @news_store = NewsStore.new
      @news_store.title = datas["title"]
      @news_store.url = datas["url"]
      @news_store.description = datas["description"]
      @news_store.category = "business"
      @news_store.urlToImage = datas["urlToImage"]
      @news_store.save
    end
      
    NewsStore.order("created_at: :desc")
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=science&apiKey=#{news_api_key}") #news_API
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    @datas[0..9].each do |datas|
      @news_store = NewsStore.new
      @news_store.title = datas["title"]
      @news_store.url = datas["url"]
      @news_store.description = datas["description"]
      @news_store.category = "science"
      @news_store.urlToImage = datas["urlToImage"]
      @news_store.save
    end

    NewsStore.order("created_at: :desc")
    news_api_key=ENV["NEWS_API_KEY"]
    uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=#{news_api_key}") #news_API
    responses = Net::HTTP.get(uri)
    @moment = JSON.parse(responses)
    @datas = @moment['articles']
    @datas[0..9].each do |datas|
      @news_store = NewsStore.new
      @news_store.title = datas["title"]
      @news_store.url = datas["url"]
      @news_store.description = datas["description"]
      @news_store.category = "technology"
      @news_store.urlToImage = datas["urlToImage"]
      @news_store.save
    end
  end
end

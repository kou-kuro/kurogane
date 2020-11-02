namespace :news do 
  desc "news"
  task news_save_box: :environment do


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
      @news_store.save
    end
      
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
      @news_store.save
    end


  end
end


  #   <% @data[0..7].each do |data| %>
  #     <ul class='lists'>
  #       <%= link_to data["url"] do %>
  #        <h3 class='item-name'>
  #         <%= data["title"].truncate(18) %>
  #        </h3>
  #          <div class='item-img-content' >
  #           <%# <%= image_tag data["urlToImage"], class:"item-img" %> 
  #          </div>
  #      <% end %> 
  #     </ul>
  #  <% end  %>

    # news_api_key=ENV["NEWS_API_KEY"]
    # uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=science&apiKey=#{news_api_key}")
    # responses = Net::HTTP.get(uri)
    # @moment = JSON.parse(responses)
    # @datas = @moment['articles']


    # news_api_key=ENV["NEWS_API_KEY"]
    # uri = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&category=technology&apiKey=#{news_api_key}")
    # responses = Net::HTTP.get(uri)
    # @moment = JSON.parse(responses)
    # @datas = @moment['articles']
    

#   end
# end

# namespace :push_line do 
#   desc "push_line"
#   task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
#     message = {
#       type: 'text',
#       text: '朝になりました。本日も頑張りましょう。食べた食べ物を「ひらがな」で入力すると、食品のカロリーと本日のトータルカロリーが表示されます。入力ミスの場合、「みす」と入力すると最新の入力を消去できます。カロリー計算に使ってください。'
#     }
#     client = Line::Bot::Client.new { |config|
#       config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
#       config.channel_token = ENV["LINE_API_KEY"]
#     }
#     response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
#     p response
#   end
# end

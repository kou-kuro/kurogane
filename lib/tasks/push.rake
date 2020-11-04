namespace :push_line do 
  desc "push_line"
  task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
    message = {
      type: 'text',
      text: 'さぁ、休憩しましょう',
          # news_api_key=ENV["NEWS_API_KEY"]
          # url = URI.parse("http://newsapi.org/v2/top-headlines?country=jp&apiKey=#{news_api_key}")
          # response = Net::HTTP.get(url)
          # @moments = JSON.parse(response)
          # @data = @moments['articles']
          # @data[0..7].each do |data|
          #     link_to data["url"] do
          #      data["title"].truncate(18)
          #     end 
          # end
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_API_KEY"]
    }
    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  end
end

# namespace :push_line do 
#   desc "push_line"
#   task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
#     message = {
#       type: 'text',
#       text: 'さぁ、休憩しましょう'
#     }
#     client = Line::Bot::Client.new { |config|
#       config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
#       config.channel_token = ENV["LINE_API_KEY"]
#     }
#     response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
#     p response
#   end
# end
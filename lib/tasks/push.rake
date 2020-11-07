namespace :push_line do 
  desc "push_line"
  task push_line_message_morning: :environment do # 以下にpush機能のタスクを書く。
    @news_store = NewsStore.all.order("created_at DESC").where(category: 'all')
    str = ""
    @news_store[0..3].each do |news_store|
      str << news_store["title"] 
    end
    @str = str
    message = {
      type: 'text',
      # text: 'さぁ、休憩しましょう',
      text: @str

    }
    
      client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_API_KEY"]
    }
    response = client.push_message(ENV["LINE_CHANNEL_USER_ID"], message)
    p response
  # end
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
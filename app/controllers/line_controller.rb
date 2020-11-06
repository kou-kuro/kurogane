class LineController < ApplicationController

#   require 'line/bot'

#   def client
#     @client ||= Line::Bot::Client.new { |config|
#       config.channel_secret = ENV["<channel secret>"]
#       # config.channel_token = 'p9ywIMdLmsts+dpnwbhmBv+e8qcXLV1evXSYDjHiTAW7m9/9UwUPMClZk7LlYfIs2b3Q587/dF2BMUxAly7eYZRjR0ZWLALblmXCVapJd/Jy//W7f7pKWQgPb80+Kb2VGiyoJHATOEgpcrJpdigCKwdB04t89/1O/w1cDnyilFU='
#     }
#   end
#   client = Line::Bot::Client.new{ |config|
#     config.channel_secret = ENV["<channel secret>"]
#     config.channel_token = ENV["<channel token>"]
#   }
#   user_ids = [user_id1, user_id2, ...]
#   client.multicast(user_ids, <message>)
end

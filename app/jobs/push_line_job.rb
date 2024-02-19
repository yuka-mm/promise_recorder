class PushLineJob < ApplicationJob
  queue_as :default

  def perform(child, message)
    line_message = {
      type: 'text',
      text: "いつもご利用ありがとうございます！\n" +
            "今日は #{child.name}さんのご褒美dayです🎁✨\n" +
            "たくさん頑張ったと思うのでいっぱい褒めてあげてください😆‼️\n\n" +
            "＝＝＝＝今回のご褒美＝＝＝\n" +
            "#{message}\n"
    }
  
    response = client.push_message(child.parent.uid, line_message)
  end

  private

  require 'line/bot'

  def client
    puts "LINE_CHANNEL_TOKEN: #{ENV["LINE_CHANNEL_TOKEN"]}" 

    client = Line::Bot::Client.new { |config|
              config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
              config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
            }
  end
end

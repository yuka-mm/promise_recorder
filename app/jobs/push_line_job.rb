# frozen_string_literal: true

class PushLineJob < ApplicationJob
  queue_as :default

  def perform(child, message)
    line_message = {
      type: 'text',
      text: "いつもご利用ありがとうございます！\n" \
            "今日は #{child.name}さんのご褒美dayです🎁✨\n" \
            "たくさん頑張ったと思うのでいっぱい褒めてあげてください😆‼️\n\n" \
            "＝＝＝＝今回のご褒美＝＝＝\n" \
            "#{message}\n"
    }

    client.push_message(child.parent.uid, line_message)
  rescue StandardError => e
    Rails.logger.error("Failed to send LINE notification: #{e.message}")
    Rails.logger.error(e.backtrace.join("\n"))
  end

  private

  require 'line/bot'

  def client
    puts "LINE_CHANNEL_TOKEN: #{ENV['LINE_CHANNEL_TOKEN']}"

    Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end
end

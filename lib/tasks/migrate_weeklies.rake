# frozen_string_literal: true

namespace :db do
  desc 'Migrate day_of_week from promises to weeklies'
  task migrate_day_of_week: :environment do
    Promise.find_each do |promise|
      puts "Processing Promise ID: #{promise.id}"
      next if promise.day_of_week.nil?

      # day_of_weekは0:日から始まり6:土なので、これを1:月から7:日の範囲にマッピングします
      # 日曜日は0から7に、それ以外は+1して調整します
      week_id = promise.day_of_week.zero? ? 7 : promise.day_of_week

      # 新しいWeeklyレコードを作成
      Weekly.create(week_id:, promise_id: promise.id)

      # promise.update(day_of_week: nil)
    end
    puts 'Day of week migration completed.'
  end
end

namespace :reward do
  desc 'Send task achievement rewards'
  task send_reward: :environment do
    # 現在の日付を取得
    today = Date.today
    puts "Today is #{today}"
  
    Child.find_each do |child|
      # 子ユーザーに関連するPaydayとRewardが存在するかをチェック
      next unless child.payday.present? && child.rewards.present?
      puts "Processing child #{child.id}"

      # 子ユーザーに関連するPaydayを取得
      payday = child.payday
  
      # ユーザーが設定した通知日と現在の日付が一致しているか確認
      next unless payday.date == today.day || Payday.weeks[payday.week] == today.wday || (payday.end_month && today.end_of_month)
      puts "child #{child.id} because payday or rewards are missing"
  
      # 累計ポイントを取得
      point_sum = child.monthly_points
      puts "Points for child #{child.id}: #{point_sum}"
  
      # Rewardを取得
      reward_by_pieces = child.rewards.where('pieces <= ?', point_sum).order(pieces: :desc).first
      reward_by_pt_range = child.rewards.where('pt_range <= ?', point_sum).order(pt_range: :desc).first
      reward = reward_by_pieces || reward_by_pt_range || child.rewards.first
      puts "Reward for child #{child.id}: #{reward}"
  
      # 通知文作成
      message = if point_sum.nil? || point_sum <= 0
                  "まだタスクを達成していません。次は頑張ろう💪‼️"
                else
                  if reward
                    if reward.pieces.present? && reward_by_pieces
                      "#{point_sum}こ守れたので#{reward_by_pieces.body}GET✨\nおめでと〜〜〜🎉👏"
                    elsif reward.pt_range.present? && reward_by_pt_range
                      "#{point_sum}ポイント達成したので#{reward_by_pt_range.body}GET✨\nおめでと〜〜〜🎉👏"
                    else
                      "#{reward.body}#{point_sum}#{reward.pt_addition}分GET✨\nおめでと〜〜〜🎉👏"
                    end
                  end
                end

      # 親ユーザーに通知
      puts "Action type: #{payday.action_type}"
      case payday.action_type
      when 'mail_type'
        # 親ユーザーにメール送信
        ParentMailer.achievement_notification(child.parent, child, message).deliver_now
      when 'line_type'
        # 親ユーザーにライン送信
        PushLineJob.perform_later(child, message)
      when 'not_set'
        next
      end
  
      # monthly_pointsのリセットとcompletedのリセット
      child.update(monthly_points: 0)
    end
  end
end

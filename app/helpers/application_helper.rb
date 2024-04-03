# frozen_string_literal: true

# ApplicationHelper provides utility methods for views.
module ApplicationHelper
  def default_meta_tags
    {
      site: 'Promise Recorder',
      title: '約束を毎日の習慣に！',
      reverse: true,
      charset: 'utf-8',
      description: '子どもとの約束を登録管理して『できた！』を増やすお手伝いをします',
      keywords: '子ども,約束,約束守らせる,約束守らない',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description, 
        type: 'website',
        url: request.original_url,
        image: image_url('logo2.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@yuka_ponnchann',
      }
    }
  end
end

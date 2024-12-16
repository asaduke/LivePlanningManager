module ApplicationHelper
  def default_meta_tags
    {
      site: 'Live Planning Manager',
      title: 'Live Planning Manager',
      reverse: true,
      charset: 'utf-8',
      description: 'Live Planning Managerは、ライブに行く際の持ち物リストの作成ができ、任意で投稿もできるアプリです。',
      keywords: 'Live, ライブ, リスト, 管理, 投稿',
      canonical: 'request.original_url',
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('OGP.png'),
        local: 'ja-JP'
      },
      # Twitter(X)用設定
      twitter: {
        card: 'summary_large_image',
        image: image_url('OGP.png')
      }
    }
  end
end

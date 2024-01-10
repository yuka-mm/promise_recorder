Rails.application.routes.draw do
  # ログイン機能
  devise_for :parents
  devise_scope :parent do
    get '/parents/sign_out' => 'devise/sessions#destroy'
  end

  # トップページ
  root to: 'top#top'
  get 'top_page', to: 'top#top'
end

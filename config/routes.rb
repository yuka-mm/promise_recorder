Rails.application.routes.draw do
    root to: 'children#index'

  # ログイン機能
  devise_for :parents
  devise_scope :parent do
  get '/parents/sign_out', to: 'devise/sessions#destroy'
  end
  resources :parents, only: %i[show]

  # トップページ
  get 'top_page', to: 'top#top'

  resources :children


end

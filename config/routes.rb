Rails.application.routes.draw do
    root to: 'children#index'

  # 親ユーザー
  devise_for :parents, controllers: {
    sessions: 'parents/sessions',
    passwords: 'parents/passwords',
    registrations: 'parents/registrations',
  }
  devise_scope :parent do
  get '/parents/sign_out', to: 'devise/sessions#destroy'
  end
  resource :parents, only: %i[show]

  # 子ユーザー
  resources :children do
    post 'check_password', on: :collection
    post 'select_child', on: :member
  end

  # トップページ
  get 'top_page', to: 'top#top'
end

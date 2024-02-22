require 'sidekiq/web'

Rails.application.routes.draw do
  # 親ユーザー
  devise_for :parents, controllers: {
    sessions: 'parents/sessions',
    passwords: 'parents/passwords',
    registrations: 'parents/registrations',
    omniauth_callbacks: 'parents/omniauth_callbacks'
  }
  devise_scope :parent do
    get '/parents/sign_out', to: 'devise/sessions#destroy'
  end
  resource :parent, only: %i[show]

  # 子ユーザー
  resources :children do
    post 'check_password', on: :collection
    post 'select_child', on: :member
    # 子ユーザー関連
    resource :payday, only: %i[new edit create update]
    resources :rewards, only: %i[index new edit update create destroy]
    resources :promises, only: %i[index show edit update create destroy] do 
      collection do
        get 'calendar'
      end
    end
    resources :counts, only: %i[index update] # 今日のやくそくページ
  end

  # トップページ
  get 'top_page', to: 'top#top_page'
  get 'help_page', to: 'top#help_page'
  get 'terms_of_service', to: 'top#terms_of_service'
  get 'privacy_policy', to: 'top#privacy_policy'
  get 'navigate', to: 'top#navigate'
  get 'welcome', to: 'top#welcome'

  get '/up', to: 'application#up'

  root to: 'children#index'

  # テストメール用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  if Rails.env.development?
    mount Sidekiq::Web, at: '/sidekiq'
  end
end

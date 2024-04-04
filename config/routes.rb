# frozen_string_literal: true

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
    get 'confirm_email', to: 'parents#confirm_email', as: :confirm_email
    get 'change_email', to: 'parents#edit_email', as: :edit_email
    post 'change_email', to: 'parents#update_email'
    get 'password_edit', to: 'parents#password_edit', as: :password_edit # パスワードリセットメール送信フォームの表示
    post 'create_reset', to: 'parents#create_reset'
  end
  resource :parent, only: %i[show]

  resources :notices, only: %i[index] do
    delete :destroy_all, on: :collection
  end

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
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  mount Sidekiq::Web, at: '/sidekiq' if Rails.env.development?

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end

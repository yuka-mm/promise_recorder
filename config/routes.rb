Rails.application.routes.draw do
  root to: 'top#top_page'

  get 'top', to: 'top#top_page'
end

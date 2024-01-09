Rails.application.routes.draw do
  root to: 'top#top'

  get 'top_page', to: 'top#top'
end

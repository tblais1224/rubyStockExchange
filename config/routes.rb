Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout', to: 'sessions#logout'

  get 'quote/new', to: 'stocks#new'

  get 'quote', to: 'stocks#quoted'

  post 'quote', to: 'stocks#quote'

  get 'stocks/buy'

  get 'stocks/sell'

end

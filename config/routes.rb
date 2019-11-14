Rails.application.routes.draw do

  get 'portfolio/show'

  get 'portfolio/history'

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout', to: 'sessions#logout'

  get 'quote/new', to: 'stocks#new'

  get 'quote', to: 'stocks#quoted'

  post 'quote', to: 'stocks#quote'

  post 'buy', to: 'stocks#buy'

  get 'stocks/sell'

end

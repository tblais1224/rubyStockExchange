Rails.application.routes.draw do

  get 'portfolio', to: 'portfolios#show'

  get 'history', to: 'portfolios#history'

  post 'cash/add', to: 'portfolios#add_cash'

  post 'cash/withdraw', to: 'portfolios#withdraw_cash'

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

  post 'sell', to: 'stocks#sell'

end

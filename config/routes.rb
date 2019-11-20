Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get '/', to: 'sessions#welcome'

  get 'authorized', to: 'sessions#page_requires_login'

  delete 'logout', to: 'sessions#logout'

  get 'quote/new', to: 'stocks#new'

  get 'quote', to: 'stocks#quoted'

  post 'quote', to: 'stocks#quote'

  post 'buy', to: 'stocks#buy'

  post 'sell', to: 'stocks#sell'

  get 'history/buy', to: 'history#show_buy'

  get 'history/sell', to: 'history#show_sell'

  get 'portfolio', to: 'portfolios#show'

  post 'cash/add', to: 'portfolios#add_cash'

  post 'cash/withdraw', to: 'portfolios#withdraw_cash'

end

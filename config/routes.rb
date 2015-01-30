Rails.application.routes.draw do

  root to: 'banks#index'
  resources :banks, only: [:index, :show]

end

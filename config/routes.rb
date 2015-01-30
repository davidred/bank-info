Rails.application.routes.draw do

  resources :banks, only: [:index, :show]

end

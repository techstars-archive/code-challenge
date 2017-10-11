Rails.application.routes.draw do
  
  root 'companies#index'

  resources :companies do
    resources :founders, only: [:new, :create]
  end 
end
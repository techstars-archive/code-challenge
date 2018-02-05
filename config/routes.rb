Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'

  resources :companies do
    resource :founders, only: [ :new, :create ]
  end
end

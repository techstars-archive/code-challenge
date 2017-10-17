Rails.application.routes.draw do
  resources :companies do
    resources :founders
  end
  root 'companies#index'
end

Rails.application.routes.draw do
  resources :companies do
    resources :founders
    resources :tags
  end
  root 'companies#index'
end

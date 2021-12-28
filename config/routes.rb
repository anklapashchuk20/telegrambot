Rails.application.routes.draw do
  root "articles#index"

  resources :articles
  resources :books
  resources :creators 
  resources :sellers
  
end

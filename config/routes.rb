Rails.application.routes.draw do
  root 'books#index' # 'controllername#controlleraction'
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'books#index' # 'controllername#controlleraction'
  resources :books do
    member do
      get 'show_vote'
      post 'vote'
      post 'unvote'
    end
  end
  resources :readers do
    member do
      get 'find_or_create'
      post 'find_or_create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

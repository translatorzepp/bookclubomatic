Rails.application.routes.draw do
  resources :readers
  root 'books#index' # 'controllername#controlleraction'
  resources :books do
    member do
      get 'show_vote'
      post 'vote'
      post 'unvote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

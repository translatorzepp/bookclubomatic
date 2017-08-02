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
      post 'find_or_create'
    end
  end
end

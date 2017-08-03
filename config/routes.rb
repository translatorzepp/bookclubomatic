Rails.application.routes.draw do
  root 'books#index' # 'controllername#controlleraction'

  resources :books do
    member do
      post 'vote'
      post 'unvote'
      post 'set_voter_name'
    end
  end
end

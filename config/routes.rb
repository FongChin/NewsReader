NewReader::Application.routes.draw do
  resources :feeds, only: [:index, :create] do
    resources :entries, only: [:index]
    member do
      post 'favorite'
    end
  end

  resources :users, only: [:new, :create] do
    get "feeds"
  end
  resource :session

  root to: "sessions#new"
end

Rails.application.routes.draw do
  resources :users
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :questions do
    # コレクションルーティング
    collection do
      get :solved
      get :unsolved
    end

    member do
      post :solve
    end
    resources :answers, only: [:create, :destroy]
  end
end

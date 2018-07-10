Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'application#index'
    resources :users do
        resources :consoles, only: [:index, :show, :new, :edit] do
            resources :games, only: [:new, :edit]
        end
    end
    resources :consoles
    resources :games
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/users/:user_id/consoles/:id/destroy' => 'consoles#destroy'
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  authenticated :user do
    resources :cards do
      collection { post :import }
      resources :billings
    end
  end
end

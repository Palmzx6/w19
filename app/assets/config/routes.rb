Rails.application.routes.draw do
    root 'categories#index'
    
    resources :categories do
      resources :tasks, only: [:create, :update, :destroy]
    end
  end
  
Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  get 'carenders/top'
  get 'homes/top'
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users
  resources :users
  resources :posts
  resources :expressions do
    resource :favorites,only: [:create, :destroy]
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
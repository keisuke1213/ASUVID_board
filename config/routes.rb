Rails.application.routes.draw do
  get 'carenders/top'
  get 'homes/top'
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users
  resources :posts do
     resources :expressions
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
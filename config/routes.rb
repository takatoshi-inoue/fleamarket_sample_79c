Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
  get 'card/new'
  get 'card/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    collection do
      get :search
    end
  end
  
  resources :posts, only: [:new,:create,:show,:destroy] do
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end

  resources :users, only: [:show]

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
  
end

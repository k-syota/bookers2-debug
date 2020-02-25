Rails.application.routes.draw do
  get 'book_comment/create'
  get 'book_comment/destroy'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:show, :index, :create, :edit, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
    # post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
    # delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  end
  root 'home#top'
  get 'home/about'
end

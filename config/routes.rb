Rails.application.routes.draw do
  get 'book_comment/create'
  get 'book_comment/destroy'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:show, :index, :create, :edit, :destroy] do
    post "favorites", to: "favorites#create", as: :favotites_create
    delete "favorites", to: "favorites#destroy", as: :favorites_delete
    post "book_comments", to: "book_comments#create", as: :comments_create
    delete "book_comments/:id", to: "book_comments#destroy", as: :comments_delete
  end
  root 'home#top'
  get 'home/about'
end

Rails.application.routes.draw do

  namespace :admin do
    get 'blogs/index'
    get 'blogs/show'
    get 'blogs/new'
    get 'blogs/edit'
  end
  namespace :customer do
    get 'blogs/show'
    get 'blogs/index'
  end
  namespace :admin do
    get 'categories/create'
    get 'categories/update'
    get 'categories/hide'
  end
  root to: 'customers/homes#top'
  devise_for :admins, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
  }

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
  }

  namespace :customer do
    get 'admins/edit'
    get 'admins/favorites'
  end
  namespace :admin do
    resources :categories

    get 'homes/topic'
    get 'homes/movie'
    get 'homes/music'
    get 'homes/live'
    get 'category/:id' => "homes#category"
    get 'customer_rooms/show'
    get 'rooms/show'
    resources :customers, only: [:index, :show]
    resources :informations
    resources :topics
    resources :lives
    resources :discs
    resources :musics
    resources :videos
    resources :movies
    resources :blogs
  end
  namespace :customers do
    resources :discs, only: [:index, :show]
    resources :videos, only: [:index, :show]
    resources :lives, only: [:index, :show]
    resources :informations, only: [:index, :show]
  end

  namespace :customer do
    get 'customers/favorites'
  end
  namespace :customers do
    resources :rooms
    resources :customers, only: [:edit, :show, :index, :update, :create]
     put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
    get 'homes/about' => "homes#about"
    get 'homes/biography'=> "homes#biography"
    get 'homes/top'=> "homes#top"
    get 'category/:id' => "homes#category"
    get 'homes/top_second' => "homes#top_second"
    get 'homes/top_third' => "homes#top_third"
    resources :movies, only: [:index, :show]
    resources :topics, only: [:index, :show]
    resources :blogs, only: [:index, :show] do
      resources :blog_comments
      resource :blog_favorites, only: [:create, :destroy]
    end
    resources :musics, only: [:show, :index] do
      resources :comments
      resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

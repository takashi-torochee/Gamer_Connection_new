Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

    get 'relationships/follows' => 'public/relationships#follows'
    get 'relationships/followers' => 'public/relationships#followers'
    
    get 'users/posts' => 'public/posts#new'
    post 'users/posts' => 'public/posts#create'
    get 'users/posts/edit/:id' => 'public/posts#edit', as: "users_posts_edit"
    patch 'users/posts/edit/:id' => 'public/posts#update'
    get 'users/posts/:id' => 'public/posts#show', as: "users_posts_show"
    delete 'users/posts/:id' => 'public/posts#destroy', as: "destroy_posts"

    get 'users/:id' => 'public/users#show', as: "users_show"
    get 'users/:id/edit' => 'public/users#edit', as: "users_edit"
    patch 'users/:id/edit' => 'public/users#update'
    get 'users/:id/withdraw_confirm' => 'public/users#withdraw_confirm', as: "users_withdraw"
    
    get 'users/:id/follows' => 'public/users#follows', as: "follows"
    get 'users/:id/followers' => 'public/users#followers', as: "followers"
    delete 'users/:user_id/relationships' => 'public/relationships#destroy', as: "relationships"
    post 'users/:user_id/relationships' => 'public/relationships#create'

   

    post 'users/posts/:id/comments' => 'public/comments#create', as: "posts_comments"



    root to: 'public/homes#top'

  namespace :admin do
    resources :users, only: [:show, :edit, :update]
  end
  namespace :admin do
    get 'homes' => 'homes#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

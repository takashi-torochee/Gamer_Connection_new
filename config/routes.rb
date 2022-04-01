Rails.application.routes.draw do

    get 'relationships/follows' => 'public/relationships#follows'
    get 'relationships/followers' => 'public/relationships#followers'


    get 'users' => 'public/users#show'
    get 'users/edit' => 'public/users#edit'
    get 'users/withdraw_confirm' => 'public/users#withdraw_confirm'

    get 'users/posts' => 'public/posts#new'
    post 'users/posts' => 'public/posts#create'
    get 'users/posts/edit/:id' => 'public/posts#edit', as: "users_posts_edit"
    patch 'users/posts/edit/:id' => 'public/posts#update'
    get 'users/posts/:id' => 'public/posts#show', as: "users_posts_show"
    delete 'users/posts/:id' => 'public/posts#destroy', as: "destroy_posts"

    post 'users/posts/:id/comments' => 'public/comments#create', as: "posts_comments"



    root to: 'public/homes#top'

  namespace :admin do
    resources :users, only: [:show, :edit]
  end
  namespace :admin do
    get 'homes'
  end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}


  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

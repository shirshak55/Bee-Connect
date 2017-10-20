Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  #----------------------------------------------------
  # Index
  #----------------------------------------------------
  root 'dashboard#index'
  #----------------------------------------------------
  # Follow And Unfollow User
  #----------------------------------------------------
  get 'relationships/follow_user'
  get 'relationships/unfollow_user'
  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user , :user_name => /[a-zA-Z0-9_\.]*/
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user ,:user_name => /[a-zA-Z0-9_\.]*/

  #----------------------------------------------------
  # Notifications
  #----------------------------------------------------
  resources :notifications do
    collection do
      post :mark_notifications_as_read
      post :mark_messages_notification_as_read
    end
  end
  #----------------------------------------------------
  # Making Devise to support preety url
  #----------------------------------------------------
  devise_scope :user do
    get "/register" => "devise/registrations#new", as: "new_user_registration"
  end
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  #----------------------------------------------------
  # Concerns for Post , Comments and Likes
  #----------------------------------------------------
  concern :postable do
    resources :posts ,except:[:new] do
      resources :comments,only:[:index,:create,:destroy]
      member do
        get 'like'
        get 'unlike'
      end
    end
  end

  #----------------------------------------------------
  #  Post witch concerns of post comment likes
  #----------------------------------------------------
  resources :users,only: [:show] ,concerns: :postable
  #----------------------------------------------------
  # Group
  #----------------------------------------------------
  resources :groups,concerns: :postable do
    member do
      get 'members',:as=>'members'

      post 'join/:user_id', :to => "groups#join", :as => 'join'
      post 'unjoin/:user_id', :to => "groups#unjoin", :as => 'unjoin'

      post 'approve/:user_id', :to => "groups#approve", :as => 'approve'
      post 'ban/:user_id', :to => "groups#ban", :as => 'ban'
      post 'delete/:user_id', :to => "groups#delete", :as => 'delete'

      post 'make_moderator/:user_id', :to => "groups#make_moderator", :as => 'make_moderator'
      post 'demote_moderator/:user_id', :to => "groups#demote_moderator", :as => 'demote_moderator'

      get 'chat', :to => "groups#chat", :as => 'chat'
    end
  end
  #----------------------------------------------------
  # Showing All Users
  #----------------------------------------------------
  get 'all-users', to: 'profiles#show_all_users'

  #----------------------------------------------------
  # Profile
  #----------------------------------------------------
  get 'profiles/show'
  get '@:user_name', to: 'profiles#show', as: :profile ,:user_name => /[a-zA-Z0-9_\.]*/
  get '@:user_name/edit', to: 'profiles#edit', as: :edit_profile , :user_name => /[a-zA-Z0-9_\.]*/
  patch '@:user_name/edit', to: 'profiles#update', as: :update_profile ,:user_name => /[a-zA-Z0-9_\.]*/

  #----------------------------------------------------
  # Chat Message
  #----------------------------------------------------
  resources :chat_rooms, only: [:new, :create, :show, :index]

  #----------------------------------------------------
  # Search
  #----------------------------------------------------
  get 'search' , to: 'dashboard#search'
  #----------------------------------------------------
  # Personal Message
  #----------------------------------------------------
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]
  post 'conversations_api', to: 'personal_messages#api'

  mount ActionCable.server => '/cable'
end
Rails.application.routes.draw do

  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations',
    omniauth_callbacks: 'accounts/omniauth_callbacks'
  }
  # deviseのurlが変えられず後回し中。。。
  # get 'accounts/login' => 'devise/sessions#new'
  # get 'accounts/member_entry' => 'devise_invitable/registrations#new'

  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    passwords: 'owners/passwords',
    registrations: 'owners/registrations'
  }

  ######## ここからアカウント ########
  scope module: :accounts do
    # homes
    root 'homes#top'
    get 'help/beginner/' => 'homes#about', as: :about
    # accounts
    resources :accounts, only: [:edit, :update, :destroy] do
      get '' => 'accounts#mypage', as: :mypage, on: :member
      collection do
        get 'member_entry_finish' => 'accounts#welcome', as: :welcom
        get 'logout' => 'accounts#logout', as: :logout
        get 'confirm' => 'accounts#confirm', as: :confirm
        get 'goodbye' => 'accounts#goodbye', as: :goodbye
      end
    end
    # search
    get 'search/area'
    get 'search/keyword'
    get 'search/genre'
    get 'search/booking'
    get 'search/detail'
    # restaurants
    resources :restaurants, only: [:index, :show] do
      resources :reviews, only: [:new, :create, :edit, :update, :destroy]
      member do
        get 'rvwlst/:id' => 'reviews#show', as: 'review' #レビュー詳細
        patch 'rate/:id' => 'reviews#rate_update' #評価編集処理
        put 'rate/:id' => 'reviews#rate_update' #評価編集処理
      end
      collection do
        get 'rvwlst' => 'reviews#index', as: 'reviews' #レビュー一覧
        post 'rate' =>  'reviews#rate_create' #評価追加処理
      end
    end

    get 'booking_histories/index'
    get 'booking_histories/new'
    post 'booking_histories/create'

  end


  ######## ここからオーナー ########
  namespace :owners do
    resources :booking_historys, only: [:show, :index, :update]
    resources :restaurants
    get 'restaurants/welcome'
    get 'restaurants/confirm'
    get 'restaurants/goodbye'
  end

  scope module: :owners do
    resources :owners, only: [:edit, :update]
    get 'owners/mypage'
  end

end

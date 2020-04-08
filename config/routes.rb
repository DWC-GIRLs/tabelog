Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations'
  }
  devise_for :owners, controllers: {
    sessions: 'owners/sessions',
    passwords: 'owners/passwords',
    registrations: 'owners/registrations'
  }

  ######## ここからアカウント ########
  namespace :accounts do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :accounts do
    get 'search/area'
    get 'search/keyword'
    get 'search/genre'
    get 'search/booking'
    get 'search/detail'
  end
  namespace :accounts do
    get 'restaurants/show'
    get 'restaurants/index'
  end
  namespace :accounts do
    get 'booking_histories/index'
    get 'booking_histories/new'
    get 'booking_histories/create'
  end
  namespace :accounts do
    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/create'
    get 'reviews/edit'
    get 'reviews/update'
    get 'reviews/destroy'
    get 'reviews/rate_create'
    get 'reviews/rate_update'
  end
  namespace :accounts do
    get 'accounts/mypage'
    get 'accounts/edit'
    get 'accounts/update'
    get 'accounts/destroy'
    get 'accounts/logout'
    get 'accounts/welcome'
    get 'accounts/confirm'
    get 'accounts/goodbye'
  end


  ######## ここからオーナー ########
  namespace :owners do
    resources :booking_historys, only: [:show, :index, :update]

    resources :restaurants
    get 'restaurants/mypage'
    get 'restaurants/welcome'
    get 'restaurants/confirm'
    get 'restaurants/goodbye'
  end

  scope module: :owners do
    resources :owners, only: [:edit, :update]
    get 'owners/mypage'
  end

end

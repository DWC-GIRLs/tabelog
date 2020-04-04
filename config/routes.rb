Rails.application.routes.draw do
  namespace :owners do
    get 'restaurants/mypage'
    get 'restaurants/new'
    get 'restaurants/create'
    get 'restaurants/welcome'
    get 'restaurants/edit'
    get 'restaurants/update'
    get 'restaurants/confirm'
    get 'restaurants/goodbye'
    get 'restaurants/destroy'
  end
  namespace :owners do
    get 'owners/mypage'
    get 'owners/edit'
    get 'owners/update'
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
  namespace :accounts do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :owners
  devise_for :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

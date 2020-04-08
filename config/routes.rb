Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  devise_for :owners

  ######## ここからアカウント ########
  scope module: :accounts do
    # homes
    root 'homes#top'
    get 'help/beginner/' => 'homes#about', as: :about

    get 'search/area'
    get 'search/keyword'
    get 'search/genre'
    get 'search/booking'
    get 'search/detail'

    get 'restaurants/show'
    get 'restaurants/index'

    get 'booking_histories/index'
    get 'booking_histories/new'
    get 'booking_histories/create'

    get 'reviews/index'
    get 'reviews/new'
    get 'reviews/create'
    get 'reviews/edit'
    get 'reviews/update'
    get 'reviews/destroy'
    get 'reviews/rate_create'
    get 'reviews/rate_update'

    get 'accounts/mypage'
    get 'accounts/edit'
    get 'accounts/update'
    get 'accounts/destroy'
    get 'accounts/logout'
    get 'accounts/welcome'
    get 'accounts/confirm'
    get 'accounts/goodbye'
    get 'accounts/login' => 'devise/sessions#new'
    get 'accounts/member_entry' => 'registrations#new'
  end


  ######## ここからオーナー ########
  namespace :owners do
    get 'booking_histories/show'
    get 'booking_histories/index'
    get 'booking_histories/update'

    get 'restaurants/mypage'
    get 'restaurants/new'
    get 'restaurants/create'
    get 'restaurants/welcome'
    get 'restaurants/edit'
    get 'restaurants/update'
    get 'restaurants/confirm'
    get 'restaurants/goodbye'
    get 'restaurants/destroy'

    get 'owners/mypage'
    get 'owners/edit'
    get 'owners/update'
  end

end

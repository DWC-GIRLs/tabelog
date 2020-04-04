Rails.application.routes.draw do
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

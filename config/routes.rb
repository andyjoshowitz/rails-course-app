Rails.application.routes.draw do

  get 'welcome/home'

  get 'courses/most_popular', to: 'courses#most_popular'
  get 'instructors/:id/new_course', to: "instructors#new_course", as: "new_instructor_course"

  resources :instructors
  resources :courses do
    resources :reviews
  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :profiles
  end

   root 'welcome#home'
end

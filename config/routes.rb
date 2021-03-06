Rails.application.routes.draw do

  get 'welcome/home'
  get 'instructors/:id/new_course', to: "instructors#new_course", as: "new_instructor_course"
  get 'users/:user_id/courses', to: "users#courses", as: "user_courses"
  get 'courses/least_popular', to: "courses#least_popular", as: "least_popular_courses"

  resources :instructors
  resources :courses do
    resources :reviews
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resource :profile
  end

   root 'welcome#home'
end

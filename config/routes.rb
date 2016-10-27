Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: "web/sessions", registrations: "web/registrations", passwords: "web/passwords" }

  match '/admin/ajax_bar' => 'website/ajax_bar/ajax_bar#ajax', :as => :ajax_bar, :via => [:post, :get]

  root :to => 'dashboard#index'

  namespace :admin do
    resources :users
    resources :students
    resources :student_classes
    resources :interview_scores
    resources :written_scores
    resources :written_applies
    resources :admission_records
    resources :apply_sets
  end

end

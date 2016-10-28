Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, path: "web", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'cmon_let_me_in' }, controllers: { sessions: "web/sessions", registrations: "web/registrations", passwords: "web/passwords" }

  devise_scope :user do
    delete "/users/sign_out" => "devise/sessions#destroy"
  end

  match '/admin/ajax_bar' => 'website/ajax_bar/ajax_bar#ajax', :as => :ajax_bar, :via => [:post, :get]

  root :to => 'dashboard#index'

  namespace :admin do
    resources :users
    resources :students do
      collection do
        get :import_student
        post :create_import_student
        get :export_student
      end  
    end
    resources :student_classes
    resources :interview_scores do
      collection do
        get :import_interview_score
        post :create_import_interview_score
        get :export_interview_score
      end
    end
    resources :written_scores do
      collection do
        get :import_written_score
        post :create_import_written_score
        get :export_written_score
      end
    end
    resources :admission_records do
      collection do
        get :import_admission_record
        post :create_import_admission_record
        get :export_admission_record
      end
    end
    resources :written_applies
    resources :apply_sets
  end

  namespace :web do
    resources :interview_scores
    resources :written_scores
    resources :admission_records
    resources :written_applies
    resources :students do 
      collection do
        get :porsonal_inf
        get :user_edit_self
        put :update_password
      end
    end
  end

end

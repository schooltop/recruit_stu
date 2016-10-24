Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: "web/sessions", registrations: "web/registrations", passwords: "web/passwords" }

  root :to => 'dashboard#index'

end

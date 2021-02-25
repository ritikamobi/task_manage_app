Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: "frontend#new"
  as :user do
    get '/signup' => 'devise/registrations#new'
    get '/signin' => 'devise/sessions#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => "tasks#index"    
  resources :tasks
end

Rails.application.routes.draw do
  post '/token', to: 'tokens#create' 	
  resources :answers do
  end
  resources :questions
  resources :searches
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

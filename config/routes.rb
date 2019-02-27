Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace :api do
		namespace :v1 do
			resources :users, only: [:create, :index, :destroy, :update]
			resources :rejections, only: [:create, :destroy]
			post '/login', to: 'auth#create'
			get '/profile/', to: 'users#profile'
			get '/current_user', to: "auth#show"
			resources :rejections
      resources :cohorts, only: [:create,:index]
		end
	end
end

Rails.application.routes.draw do
  resources :technologies, except: [:show] do
  	member do
  		get :toggle_status
  	end
  end
  get 'technology/:id', to: 'technologies#show', as: 'technology_show'

  get 'about-developer', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :posts do
  	member do
  		get :toggle_status
  	end
  end
  get 'post/:id', to: 'posts#show'

  root to: "pages#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

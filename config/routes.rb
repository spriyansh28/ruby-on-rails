Rails.application.routes.draw do

  devise_for :users, path: '', path_names: {sing_in: 'login', sign_out: 'logout'}
  
  resources :technologies, except: [:show] do
  	member do
  		get :toggle_status
  	end
  end
  get 'technology/:id', to: 'technologies#show', as: 'technology_show'

  get 'about-developer', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech_news', to: 'pages#tech_news'


  resources :posts do
  	member do
  		get :toggle_status
  	end
  end
  get 'post/:id', to: 'posts#show'

  root to: "pages#home"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

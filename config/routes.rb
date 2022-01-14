Rails.application.routes.draw do
  resources :technologies
  get 'about-developer', to: 'pages#about'
  get 'contact', to: 'pages#contact' 
  resources :posts

  root to: "pages#home" 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

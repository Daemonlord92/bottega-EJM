Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'python-items', to: 'portfolios#python'
  get 'rails-items', to: 'portfolios#rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'pages/home'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
     get :toggle_status
    end
  end
  
  
  root to: 'pages#home'
end

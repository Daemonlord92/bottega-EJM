Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login',
    sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'python-items', to: 'portfolios#python'
  get 'rails-items', to: 'portfolios#rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'pages/home'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do
    member do
     get :toggle_status
    end
  end
  
  mount ActtionCable.server => '/cable'

  root to: 'pages#home'
end

Rails.application.routes.draw do

   root 'welcome#index'

   get 'sign-up', to: 'registrations#new'
   post 'sign-up', to: 'registrations#create'
   get 'sign-out', to: 'authentication#destroy'
   get 'sign-in', to: 'authentication#new'
   post 'sign-in', to: 'authentication#create'


   get '/about', to: 'about#index'
   get '/terms', to: 'terms#index'
   get '/faq', to: 'common_questions#index'

   resources :tasks
   resources :users
   resources :projects
end

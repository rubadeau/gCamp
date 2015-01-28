Rails.application.routes.draw do
 root 'welcome#index'
 get '/about', to: 'about#index'
end

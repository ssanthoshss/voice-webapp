Rails.application.routes.draw do
  
  root to: 'posts#index'

  resources :posts
  post '/test' => 'posts#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post '/webhook' => 'posts#webhook'
    end
  end
end

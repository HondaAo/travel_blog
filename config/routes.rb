Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'user' do
      resources :posts
    end
    namespace 'admin' do
      resources :admin
    end
  end
end

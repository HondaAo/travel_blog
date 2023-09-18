Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    resources :countries, only: [:index, :show]
    resources :cities, only: [:index, :show]
    resources :regions, only: [:index, :show]

    scope :posts do
      get '/top' => 'posts#top'
      get '/:id' => 'posts#show'
      post '/' => 'posts#create'
      put '/:id' => 'posts#update'
      delete '/:id' => 'posts#delete'
      root to: 'posts#index'
    end

    namespace 'admin' do
      get 'draft_list' => 'post#draft_show'
      put 'approve' => 'post#approve'
      post 'create_countries' => 'country#create'
      post 'create_city' => 'city#create'
      post 'create_region' => 'regin#create'
    end
  end
end

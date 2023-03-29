Rails.application.routes.draw do
  scope "/:locale" do

    
    resources :articles do
      member do
        get 'download_file'
      end
    end
    # resources :articles, only: [:new, :create, :show]
    devise_for :users
    
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
  root to: "home#index"

end

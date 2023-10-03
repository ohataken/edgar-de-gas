Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :session, only: [:new], path: "oauth2" do
    get :callback, on: :collection
  end

  namespace :api do
    resources :projects, only: [:show] do
      resources :project_contents, only: [:index, :show, :update], path: "contents"
      resources :project_deployments, only: [:index, :create, :show, :update, :destroy], path: "deployments"
      resources :project_versions, only: [:index], path: "versions"
    end
  end

  root "pages#root"
end

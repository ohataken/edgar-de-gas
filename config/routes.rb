Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resource :session, only: [:new], path: "oauth2" do
    get :callback, on: :collection
  end

  root "pages#root"
end

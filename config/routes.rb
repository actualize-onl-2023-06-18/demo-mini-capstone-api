Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/all" => "products#index"
  get "/singular_product/:id" => "products#show"
  # get "/comb" => "products#comb"
  # get "/sandals" => "products#sandals"
end

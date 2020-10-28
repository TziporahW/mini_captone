Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end

  namespace :api do
    get "/all_products" => "products#all"
    get "/ring" => "products#ring"
    get "/watch" => "products#watch"
    get "/earrings" => "products#earrings"
  end
end

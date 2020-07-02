Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#all"

    get "/lamp" => "products#show_the_lamp"
    get "/second_product" => "products#second_product"

    get "/any_product" => "products#any"
  end
end

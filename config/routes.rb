Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    get "/auth" => "strava_requests#auth"
    get "/redirect" => "strava_requests#redirect"
    get "/token" => "strava_requests#token"
  end
end

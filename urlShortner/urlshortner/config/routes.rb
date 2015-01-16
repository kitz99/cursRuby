Rails.application.routes.draw do
  get "/short" => "short#index"
  post "/shorturl" => "short#scurteaza"
  root "short#index"

  get "/eroare" => "short#eroare"
  get "/:urlscurt" => "short#goto"
end

Rails.application.routes.draw do
  get '/shopping' => 'shopping#shopping'
  post '/addtoshoppingcart/:product_id' => 'shopping#add'

  post '/resetshoppingcart' => 'shopping#reset'
end

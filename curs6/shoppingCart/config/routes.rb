Rails.application.routes.draw do
  get '/shoppingCart' => 'shopping#show'

  post 'addtoshoppingcart/:id' => 'shopping#add'
  post '/resetshoppingcart' => 'shopping#reset'
  post '/addnewproduct' => 'shopping#addProduct'
end

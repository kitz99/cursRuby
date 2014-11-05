Rails.application.routes.draw do

  #get 'short/index'

  # root 'welcome#index'

  # get '/showinputfields' => 'addition#showinputfields'
  get '/short' => 'short#index'
  # get '/displayresult' => 'addition#displayresult'

  # post '/performaddition' => 'addition#performaddition'
  post '/shorturl' => 'short#shorturl'

  post '/goto/:linkhash' => 'short#goto'

end

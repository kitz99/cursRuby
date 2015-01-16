Rails.application.routes.draw do
  get '/todo' => "list#todo"
  get '/showeditformfor/:id' => 'list#showeditformfor'

  post '/doaddnewitem' =>"list#doaddnewitem"

  post '/withitem/:id' => "list#withitem"

  post '/savechangesfor/:id' => 'list#savechangesfor'

  post '/buttonsatbottom' => 'list#buttonsatbottom'
end

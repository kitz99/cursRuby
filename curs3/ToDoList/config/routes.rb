Rails.application.routes.draw do
  get '/additems' => 'todo#additems'

  post '/doadditem' => 'todo#doadditem'
  post '/markasdone/:randkey' => 'todo#markasdone'
end

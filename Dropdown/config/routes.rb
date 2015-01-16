Rails.application.routes.draw do
  get "/show" => "show#index"

  post "/process_prog_lang_choice" => "show#processs"

  get "/display_results" => "show#display"
end

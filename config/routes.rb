Rails.application.routes.draw do
  
  get '/item' => 'products#individual'

  get '/store' => 'products#all'

end

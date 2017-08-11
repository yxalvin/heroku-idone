Rails.application.routes.draw do
  root 'main#index'
  get '/help' => 'user_stories#index'

  # Sessions

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  # Tasks
  get '/tasks' => 'tasks#index'
  get '/tasks/new' => 'tasks#new'
  get '/tasks/:date' => 'tasks#show' 

  post '/tasks' => 'tasks#create' # important to keep to create new task for a day
  get '/tasks/:id/edit' => 'tasks#edit'
  delete '/tasks/:id' => 'tasks#destroy'
  patch '/tasks/:id' => 'tasks#update'

 # Users

  get '/users' => 'users#index'
  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

end

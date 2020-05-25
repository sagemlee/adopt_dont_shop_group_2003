Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/users/show', to: 'users#show'
  get '/users/new', to: 'users#new'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show'

  namespace :admin do
    get '/dashboard', to: "dashboard#index"
    get '/pets/new', to: 'pets#new'
    get '/pets/:pet_id/edit', to: 'pets#edit'
    patch '/pets/:pet_id', to: 'pets#update'
    delete '/pets/:pet_id', to: 'pets#destroy'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:shelter_id', to: 'shelters#show'
  get '/shelters/:shelter_id/edit', to: 'shelters#edit'
  patch '/shelters/:shelter_id', to: 'shelters#update'
  delete '/shelters/:shelter_id', to: 'shelters#destroy'
  post '/shelters', to: 'shelters#create'

  get '/pets', to: 'pets#index'
  get '/pets/:pet_id', to: 'pets#show'

  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  get '/favorites', to: 'favorites#index'
  delete '/favorites', to: 'favorites#destroy_all'
  patch '/favorites/:pet_id', to: 'favorites#update'
  delete '/favorites/:pet_id', to: 'favorites#destroy'

  get 'shelters/:shelter_id/reviews/new', to:'reviews#new'
  post '/shelters/:shelter_id', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/reviews/:review_id', to: 'reviews#update'
  delete '/shelters/:shelter_id/reviews/:review_id', to: 'reviews#destroy'

  get '/applications/new', to: 'applications#new'
  post '/applications', to: 'applications#create'
  get '/applications/:application_id', to: 'applications#show'

  get 'pets/:pet_id/applications', to: 'pet_applications#index'
  patch 'pets/:pet_id/applications/:application_id', to: 'pet_applications#update_approval'
  delete 'pets/:pet_id/applications/:application_id', to: 'pet_applications#destroy_approval'

end

Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:shelter_id', to: 'shelters#show'
  get '/shelters/:shelter_id/edit', to: 'shelters#edit'
  patch '/shelters/:shelter_id', to: 'shelters#update'
  delete '/shelters/:shelter_id', to: 'shelters#destroy'
  post '/shelters', to: 'shelters#create'

  get '/pets', to: 'pets#index'
  get '/pets/new', to: 'pets#new'
  get '/pets/:pet_id', to: 'pets#show'
  get '/pets/:pet_id/edit', to: 'pets#edit'
  patch '/pets/:pet_id', to: 'pets#update'
  delete '/pets/:pet_id', to: 'pets#destroy'

  get '/shelters/:shelter_id/pets', to: 'shelter_pets#index'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'

  patch '/favorites/:pet_id', to: 'favorites#update'
<<<<<<< HEAD

  get 'shelters/:shelter_id/reviews/new', to:'reviews#new'
  post '/shelters/:shelter_id', to: 'reviews#create'

=======
  get '/favorites', to: 'favorites#index'
>>>>>>> master
end

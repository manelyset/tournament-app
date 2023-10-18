Rails.application.routes.draw do
  root 'teams#index'

  resources :teams, only: %i[index create]
  resources :tournament_rounds, only: %i[index create]
end

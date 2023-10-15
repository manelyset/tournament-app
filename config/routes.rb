Rails.application.routes.draw do
  root 'teams#index'

  resource :teams, only: %i[index create]
  resource :tours, only: %i[index]
end

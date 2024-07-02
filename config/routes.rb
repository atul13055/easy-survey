Rails.application.routes.draw do
  resources :surveys
  resources :components, only: [:create, :destroy]
  root "surveys#new"
end

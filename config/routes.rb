Bestellungmanager::Application.routes.draw do
  get "pages/home"

  get "login" => "sessions#new", as: "login"
  post "sessions" => "sessions#create", as: "sessions"
  delete "logout" => "sessions#destroy", as: "logout"

  resources :auftrags

  resources :bestellungs

  resources :users

  resources :artikels
  get "artikels/:id/laden" => "artikels#laden", as: "laden_artikel"



   root :to => "pages#home"


end

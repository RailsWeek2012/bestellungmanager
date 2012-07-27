Bestellungmanager::Application.routes.draw do
  get "pages/home"


  resources :bestellungs

  resources :gruppes

  resources :users

  resources :artikels
  get "artikels/:id/laden" => "artikels#laden", as: "laden_artikel"

  match "/auth/:provider/callback" => "sessions#create" 
  match "/signout" => "sessions#destroy", :as => :signout


   root :to => "pages#home"


end

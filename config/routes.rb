Rails.application.routes.draw do
  resources :stations do
    get :map, on: :collection
  end
end

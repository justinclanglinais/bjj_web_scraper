Rails.application.routes.draw do
  resources :athletes do
    match '/scrape', to: 'athletes#scrape', via: :post, on: :collection
  end
  
  root to: 'athletes#index'
end

Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :retail_stores do
      resources :store_timings
    end
  end


  namespace :api, defaults: {format: 'json'} do
    resources :retail_stores, only: :index
  end

end

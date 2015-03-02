Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :retail_stores
    end

end

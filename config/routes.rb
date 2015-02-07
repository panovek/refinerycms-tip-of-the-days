Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :tip_of_the_days do
    resources :tip_of_the_days, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :tip_of_the_days, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :tip_of_the_days, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

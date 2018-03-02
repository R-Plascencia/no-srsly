Rails.application.routes.draw do

  # On localhost use lvh.me:3000/api
  # lvh.me is alias for localhost!
  namespace :api do
    namespace :v1 do

      resources :sources do
        resources :articles
      end
      resources :articles, :only => [:create] do
        collection do
          post :find
        end
      end

    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

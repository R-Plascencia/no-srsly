Rails.application.routes.draw do

  # On localhost use api.lvh.me:3000
  # lvh.me is alias for localhost!
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do

        resources :sources do
          resources :articles
        end
        resources :articles

      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

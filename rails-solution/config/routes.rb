Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "parrolabs#index"

  resources :parrolabs, only: [:index] do
  	collection do
  		get 'calculate'
  	end
  end

  namespace :api do
  	namespace :v1 do
  		resources :checkout, except: [:index, :show, :create, :new, :edit, :update, :destroy] do
  			collection do
  				post 'calculate'
  			end
  		end
  	end
  end
end

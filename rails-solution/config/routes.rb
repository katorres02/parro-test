Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "parrolabs#index"

  resources :parrolabs, only: [:index] do
  	collection do
  		get 'calculate'
  	end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  
  resources :users, except: [:index, :delete]
  
  
  resources :big_purposes, except: [:delete] do
    collection do
      get :completed
    end
    
    member do
      resources :small_purposes, except: [:delete] do
          collection do
            get :completed
          end 
      end 
    end 
  end 
  
  resources :time_reports, only: [:new, :create, :edit, :update]
  resources :growth_reports, only: [:new, :create, :edit, :update]
end

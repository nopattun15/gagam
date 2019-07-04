Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, except: [:index, :delete]
  
  
  resources :big_purposes, except: [:delete] do
    
    member do
      put :finish
    end 
    
    collection do
      get :completed
    end

    resources :small_purposes, except: [:delete] do
      member do
        put :finish
      end 
      
      collection do
        get :completed
      end 
    end 
     
  end 
  
  resources :small_purposes, except: [:delete] do
    resources :time_reports, only: [:new, :create, :edit, :update]
    resources :growth_reports, only: [:new, :create, :edit, :update]
  end 
  
  
  
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  
  resources :user, except: [:index, :delete]
  
  resources :small_purpose, except: [:delete] do
    collection do
      get :completed
    end 
  end 
  
  resources :big_purpose, except: [:delete] do
    collection do
      get :completed
    end
    
    member do
      resources :small_purpose, only: [:index, :show, :completed]
    end 
  end 
  
  resources :time_report, only: [:new, :create, :edit, :update]
  resources :growth_reports, only: [:new, :create, :edit, :update]
end

Server::Application.routes.draw do

  match 'api/getgroups' => "api#getgroups", :via => :get
  match 'api/getschedule' => "api#getschedule", :via => :get
  
  match 'schedules/:id/recovery' => 'schedules#recovery', :as => 'schedule_recovery', :via => :post
  match 'schedules/rbin' => 'schedules#rbin', :via => :get
  resources :schedules

  match 'subjects/:id/recovery' => 'subjects#recovery', :as => 'subject_recovery', :via => :post
  match 'subjects/rbin' => 'subjects#rbin', :via => :get
  resources :subjects

  match 'pairs/:id/recovery' => 'pairs#recovery', :as => 'pair_recovery', :via => :post
  match 'pairs/rbin' => 'pairs#rbin', :via => :get
  resources :pairs

  match 'weekdays/:id/recovery' => 'weekdays#recovery', :as => 'weekday_recovery', :via => :post
  match 'weekdays/rbin' => 'weekdays#rbin', :via => :get
  resources :weekdays

  match 'teachers/:id/recovery' => 'teachers#recovery', :as => 'teacher_recovery', :via => :post
  match 'teachers/rbin' => 'teachers#rbin', :via => :get
  resources :teachers

  match 'groups/:id/recovery' => 'groups#recovery', :as => 'group_recovery', :via => :post
  match 'groups/rbin' => 'groups#rbin', :via => :get
  resources :groups

  match 'levels/:id/recovery' => 'levels#recovery', :as => 'level_recovery', :via => :post
  match 'levels/rbin' => 'levels#rbin', :via => :get
  resources :levels

  match 'faculties/:id/recovery' => 'faculties#recovery', :as => 'faculty_recovery', :via => :post
  match 'faculties/rbin' => 'faculties#rbin', :via => :get
  resources :faculties

  match 'rooms/:id/recovery' => 'rooms#recovery', :as => 'room_recovery', :via => :post
  match 'rooms/rbin' => 'rooms#rbin', :via => :get
  resources :rooms

  match 'buildings/:id/recovery' => 'buildings#recovery', :as => 'building_recovery', :via => :post
  match 'buildings/rbin' => 'buildings#rbin', :via => :get
  resources :buildings
  
  match 'workspace/update_level_select/:id', :controller=>'workspace', :action => 'update_level_select'
  match 'workspace' => "workspace#index", :via => :get
  
  authenticated :user do
    root :to => 'workspace#index'
  end
  unauthenticated :user do
    devise_scope :user do 
      root :to => "devise/sessions#new"
    end
  end
  # root :to => "devise/sessions#new"
  devise_for :users
  resources :users
end

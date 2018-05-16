Rails.application.routes.draw do
  resources :lessons
  resources :commentaries
  resources :publications
  resources :materials
  resources :failures
  resources :enrolls
  resources :extended_notes
  resources :horaries
  resources :groups
  resources :covenants
  resources :given_courses
  resources :students
  resources :administrators
  resources :teachers
  resources :addresses
  resources :districts
  resources :address_church_and_document_expeditions
  
  resources :discipleships
  resources :ministeries
  resources :community_groups
  resources :cities
  resources :departments
  resources :countries
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    
    
  }
  devise_scope :user do
  get '/cargar_departamentos' => 'users/registrations#cargar_departamentos'
    
  end
  authenticated :user do
    root 'principal#home'
  end
  
  unauthenticated :user do
    root 'principal#invitado'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

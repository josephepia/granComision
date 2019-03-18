Rails.application.routes.draw do

  resources :solicits
  resources :permissions
  resources :roles
  resources :create_user
  resources :password
  resources :commentaries
  resources :publications
  resources :materials
  resources :enrolls
  resources :extended_notes
  resources :covenants
  resources :given_courses
  resources :addresses
  resources :districts
  resources :perfil
  resources :groups, only: [:index]
  get '/inscribirme', to: 'groups#inscribirme'
  resources :address_church_and_document_expeditions
  
  resources :discipleships, shallow: true do
    resources :groups do
      resources :failures
      resources :lessons
      resources :horaries
      get 'asistencia', to: 'asistencia#index'
      post 'asistencia', to: 'asistencia#create'
      
      
      # al seleccionar el grupo, se pueden visualizar las notas, modificarlas y cerrar el ciclo si lo desea. 
      get   'ciclo/notas', to: 'ciclo#index'
      post  'ciclo/notas', to: 'ciclo#guardarNotas'
      post  'ciclo/cerrar', to: 'ciclo#cerrar'

      

    end
  end  
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
  get '/cargar_grupos' => 'enrolls#cargar_grupos'
  post 'cargar_asistencia', to: 'asistencia#cargar_dia'
  #rutas para cargar notas, iniciar y cerrar ciclo
  post   'cargar_notas', to: 'ciclo#cargarNotas'
  # luego de visualizar los grupos se puede realizar 2 acciones[iniciar, cerrar] esto se hace por medio de ajax con 2 botones
  post  'ciclo/iniciar', to: 'ciclo#inicia'

  authenticated :user do
    root 'principal#home'
  end
  
  unauthenticated :user do
    root 'principal#invitado'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :inicializar_modelos, only: [:new, :cargar_departamentos]
  

  # GET /resource/sign_up
  def new
  
    super

  end
  def cargar_departamentos
    @combo = params[:combo]
    
    
    if params[:combo]== 'paisExpedicion'
    @departments = Department.where(country_id: params[:location_id]).all
      
    end
    if params[:combo]== 'departamentoExpedicion'
    @cities = City.where(department_id: params[:location_id]).all
      
    end
    if params[:combo]== 'paisResidencia'
    @departments = Department.where(country_id: params[:location_id]).all
      
    end
    if params[:combo]== 'departamentoResidencia'
    @cities = City.where(department_id: params[:location_id]).all
      
    end
    if params[:combo]== 'ciudadResidencia'
    @districts = District.where(city_id: params[:location_id]).all
      
    end
    if params[:combo]== 'paisNacimiento'
    @department = Department.where(country_id: params[:location_id]).all
      
    end
    if params[:combo]== 'departamentoNacimiento'
    @city = City.where(department_id: params[:location_id]).all
      
    end
    if params[:combo]== 'paisIglesia'
    @department = Department.where(country_id: params[:location_id]).all
      
    end
    if params[:combo]== 'departamentoIglesia'
    @city = City.where(department_id: params[:location_id]).all
      
    end
    
    
    render :partial => "departamentos", object: @department
  end
  # POST /resource
  def create
    @user = build_resource(devise_parameter_sanitizer.sanitize(:sign_up))
    if User.exists?(identificacion: @user.identificacion)
      respond_to do |format|
        flash.now[:notice] = "Esta identificacion ya se encuentra registrada"
        format.html { render :new}
        format.json { render :show, status: :created, location: @user }
      end
    elsif User.exists?(email: @user.email)
      respond_to do |format|
        flash.now[:notice] = "Este correo ya se encuentra registrado"        
        format.html { render :new}
        format.json { render :show, status: :created, location: @user }
      end
    else
        super
        #redirect_to root_path
    end
    
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:identificacion,:primerNombre,:segundoNombre,:primerApellido,:segundoApellido,:telefono,:email,:encrypted_password,:password_confirmation, :created_at,:updated_at])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end
   def inicializar_modelos
    @countries = Country.new
    @departments = Department.new
    @cities = City.new
    @districts = District.new
    @combo = params[:combo]
   end
   
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

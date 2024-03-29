class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    # @user = User.new(configure_sign_in_params)
    # if User.exists?(identificacion: @user.identificacion)

    # else
    #   respond_to do |format|
      
    #     format.html { redirect_to new_user_registration_path, notice: 'No se encuentra registrado' }
    #     format.json { render :show, status: :created, location: @user }
    #   end
    # end
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    if current_user.confirmado?
      redirect_to root_path
      
    else
      redirect_to password_index_path
      #redirect_to edit_user_password_path

      
    end
    
    
   # super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:identificacion,:password])
  end
end

class PasswordController < ApplicationController
    after_action :actualizar_estado_confirmado, only: [:create]
    def index
        @user= current_user
    end
    
    def create
        @id= current_user.id
        @user= current_user
        respond_to do |format|
          if @user.update_attributes!(password_params)
            format.html { redirect_to root_path, notice: 'Contrasena actualizada correctamente' }
            format.json { render :show, status: :ok, location: @ministery }
          else
            format.html { render :index }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    private
      def password_params
          params.require(:user).permit(:password)
      end

      def actualizar_estado_confirmado
          
        user = User.find_by(id: @id)
        user.update(confirmado: true)
      end

end

class CreateUserController < ApplicationController
    def index
        @user = User.new
    end


    def create
        @usuario = User.new(params_user)
        @usuario.password = @usuario.identificacion
        respond_to do |format|
            if @usuario.save
              format.html { redirect_to create_user_index_path, notice: 'Usuario creado correctamente' }
              format.json { render :show, status: :created, location: @usuario }
            else
              format.html { render :index }
              format.json { render json: @usuario.errors, status: :unprocessable_entity }
            end
          end
    end    

    private
        def params_user
            params.require(:user).permit(:identificacion, :primernombre,:email)
        end
        
end

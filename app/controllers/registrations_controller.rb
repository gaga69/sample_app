class RegistrationsController < Devise::RegistrationsController
    
    def after_sign_up_path_for(resource)
        user_path(resource)
    end
    
    def create
      @user = User.new(sign_up_params)
      if @user.save
        flash[:success] = "Welcom to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
    end


    private

      def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      
      def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
      end
      
end

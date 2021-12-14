class UsersController < ApplicationController
    def index
        @users = User.all
      end
      def show
        @user = User.find(params[:id])
      end
  
      def edit
        #byebug
        @user = User.find(params[:id])
      end
      def update        
          @user = User.find(params[:id])
          if @user.update(order_params)
              #byebug
              #OrderMailer.with(order: @order).new_order_email.deliver_later
              flash[:notice] = "Your user was successfully updated"
              redirect_to @user
          else
              render 'edit'
          end
      end
      def destroy
        @user = User.find(params[:id])
        #OrderMailer.with(order: @order).delete_order_email.deliver_later
        @user.destroy
        flash[:notice] = "User successfully deleted"
        redirect_to root_path
    end
  
    
      private
    
      def order_params
        params.require(:order).permit(:name, :email, :address, :phone, :message)
      end

end

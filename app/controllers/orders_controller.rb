class OrdersController < ApplicationController
    def index
      @orders = Order.all
    end
    def show
      @order = Order.find(params[:id])
    end

    def new
      @order = Order.new
    end
  
    def create
      @order = Order.new(order_params)
  
      if @order.save
        WelcomeMailer.with(order: @order).welcome_email.deliver_later
        OrderMailer.with(order: @order).new_order_email.deliver_later
        
        flash[:success] = "Thank you for your order! We'll get contact you soon!"
        redirect_to root_path
      else
        flash.now[:error] = "Your order form had some errors. Please check the form and resubmit."
        render :new
      end
    end
    def edit
      #byebug
      @order = Order.find(params[:id])
    end
    def update        
        @order = Order.find(params[:id])
        if @order.update(order_params)
            #byebug
            OrderMailer.with(order: @order).new_order_email.deliver_later
            flash[:notice] = "Your order was successfully updated"
            redirect_to @order
        else
            render 'edit'
        end
    end
    def destroy
      @order = Order.find(params[:id])
      OrderMailer.with(order: @order).delete_order_email.deliver_later
      @order.destroy
      flash[:notice] = "Order successfully deleted"
      redirect_to root_path
  end

  
    private
  
    def order_params
      params.require(:order).permit(:name, :email, :address, :phone, :message)
    end
end

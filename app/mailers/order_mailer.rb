class OrderMailer < ApplicationMailer
    def new_order_email
        #byebug
        @order = params[:order]
        #byebug
        mail(to: "carlos.caserotto@yahoo.com", subject: "You got a new message! #{@order.name}")
    end
    
    def delete_order_email
        @order = params[:order]
        mail(to: "carlos.caserotto@yahoo.com", subject: "You got a delete order message from #{@order.name}")
    end


end

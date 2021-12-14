class WelcomeMailer < ApplicationMailer
    # sends a welcome email
    def welcome_email
        @order = params[:order]
        @url = 'http://localhost:3000/sign_in'
        mail(to: @order.email, subject: 'Welcome to my awesome tutorial')
      end
  
end

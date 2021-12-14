class WelcomeUserMailer < ApplicationMailer
    def welcome_user_email
      @user = params[:user]
      @url = 'http://localhost:3000/sign_in'
      mail(to: @user.email, subject: 'Welcome to my awesome tutorial')
    end
end

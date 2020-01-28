class ClientMailer < ApplicationMailer

  def welcome(individual_client)
    @individual_client = individual_client
    mail(to: individual_client.email, subject: 'Welcome to My Awesome Site')
  end

end
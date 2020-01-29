class IndividualClientsMailer < ApplicationMailer

  def welcome(individual_client_id)
    @individual_client = IndividualClient.find(individual_client_id)
    mail(to: @individual_client.email, from: 'from@example.com', subject: 'Successful registration')
  end

end
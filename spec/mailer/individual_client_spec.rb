require 'rails_helper'

RSpec.describe IndividualClientsMailer, type: :mailer do
  describe '#confirm' do
    it 'should send to customer email' do
      individual_client = create(:individual_client, email:'teste@teste.com')
      mail = IndividualClientsMailer.welcome(individual_client.id)

      expect(mail.to).to include(individual_client.email)
    end

    it 'should send from default email' do
      individual_client = create(:individual_client, email:'teste@teste.com')
      mail = IndividualClientsMailer.welcome(individual_client.id)

      expect(mail.from).to include('from@example.com')

    end

    it 'should have default subject' do
      individual_client = create(:individual_client, email:'teste@teste.com')
      mail = IndividualClientsMailer.welcome(individual_client.id)

      expect(mail.subject).to include('Successful registration')
    end

    it 'should have default body' do
      individual_client = create(:individual_client, email:'teste@teste.com')
      mail = IndividualClientsMailer.welcome(individual_client.id)

      expect(mail.body).to include('Thanks for joining and have a great day!')
    end
  end
end
class Message < ApplicationRecord
  before_create :send_sms

  private

    def send_sms
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/AC7b8734666478b48284385f74d67e6610/Messages.json",
        :user => ENV['TWILO_SID'],
        :password => ENV['TWILO_AUTH_TOKEN'],
        :payload => {
          :Body => body,
          :From => from,
          :To => to
        }
      ).execute
    end
end

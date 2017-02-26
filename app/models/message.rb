class Message < ApplicationRecord
  before_create :send_sms

  private

    def send_sms
      response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/SKdba6160bb8d8e7472b91caa5bb10ea41/Messages.json",
        :user => "SKdba6160bb8d8e7472b91caa5bb10ea41",
        :password => "29JbQQnjbXD894bnwSNYBDqnVULCnW0h",
        :payload => {
          :Body => body,
          :From => from,
          :To => to
        }
      ).execute
    end
end

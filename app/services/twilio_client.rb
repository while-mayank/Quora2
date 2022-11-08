require 'twilio-ruby'

class TwilioClient

attr_reader :client

	def initialize
		# account_sid = 'AC13aee33964e043dd17dbe7376b908a48'
		# auth_token = '3589d4166f749564c6cbc389b097f03c'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
	end

	def sent_text(message)
		@client.messages.create(
                             body: message,
                             from: phone_number,
                             to: '+919589105993'
                           )
	end

	private

	def account_sid
		Rails.application.credentials.twilio[:account_sid]
	end

	def auth_token
		Rails.application.credentials.twilio[:auth_token]
	end

	def phone_number
		Rails.application.credentials.twilio[:phone]
	end

end
require 'twilio-ruby'
require 'awesome_print'

# get '/inbound' do

#   content_type 'text/xml'
#   "<Response><Message>Got your message</Message></Response>"
# end

post '/inbound' do
  incoming = {message: params["Body"], sender: params["From"]}

  ap incoming

  content_type 'text/xml'

  response = Twilio::TwiML::Response.new do |r|
    r.Message 'Hey thanks for messageing me!'
  end

  response.to_xml
end


  # to = params["to"]
  # message = params["body"]

  # client = Twilio::REST::Client.new(
  # ENV["TWILIO_ACCOUNT_SID"],
  # ENV["TWILIO_AUTH_TOKEN"]
  # )

  # client.messages.create(
  # to: "+14156999097",
  # from: "+14155781513",
  # body: "Yo yo" #message
  # )



# post '/receive_sms' do
#   content_type 'text/xml'

#   response = Twilio::TwiML::Response.new do |r|
#     r.Message 'Hey thanks for messageing me!'
#   end

#   response.to_xml
# end

# post '/send_sms' do
#   to = params["to"]
#   message = params["body"]

#   client = Twilio::REST::Client.new(
#   ENV["TWILIO_ACCOUNT_SID"],
#   ENV["TWILIO_AUTH_TOKEN"]
#   )

#   client.messages.create(
#   to: "+14156999097",
#   from: "+14155781513",
#   body: "Yo yo" #message
#   )
# end

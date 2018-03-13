require 'telegram/bot'
require 'net/http'

token = '418120660:AAGFcvlIok7YXDxe1F-C7LBloVm1SA908PQ'#rodkin2bot

Telegram::Bot::Client.run(token) do |bot|
bot.listen do |message|
case message.text
#    when '/start'
#      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
#    when '/stop'
#      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")

port = 80
host = 'aef927ea.ngrok.io'
path = "/api/v1/items/69"

req = Net::HTTP::Put.new(path, initheader = { 'Content-Type' => 'application/json'})
req.body = '{"item": {"id":69, "name":"1", "description":"hi2" }}'
response = Net::HTTP.new(host, port).start {|http| http.request(req) }
puts response.code
	
#bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
end
end
end
require 'telegram/bot'
require 'net/http'

token = '371210908:AAGYdl0gP3FqqT0S3d3GeCuJtvGV4S8pXCg'#@rodkin_test_bot
botname = 'rodkin_test_bot'
Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		case message.text
			when '/id' then #получаем chat_id
			bot.api.send_message(chat_id: message.chat.id, text: "chat_id= #{message.chat.id}")
			else 
#			def go # отсылаем сообщение гот клиента в рельсовую апишку
#				port = 80
#				host = '0323b81b.ngrok.io' # динамический адрес, меняется каждый раз при старте ngrok
				port = 3000
				host = 'localhost' # динамический адрес, меняется каждый раз при старте ngrok
				path = "/api/v2/items/9999999"
				req = Net::HTTP::Put.new(path, initheader = { 'Content-Type' => 'application/json'})
				req.body = '{"item": {"name":"'+message.chat.username+'",'+' "chat_id":"'+message.chat.id.to_s+'",'+' "bot_id":"'+token+'", "description":"'+'mess from '+botname+': '+message.text+'" }}'
				puts req.body
				response = Net::HTTP.new(host, port).start {|http| http.request(req) }
				puts response.code
				bot.api.send_message(chat_id: message.chat.id, text: response.code)
#				puts "ok"
#				bot.api.send_message(chat_id: message.chat.id, text: "ok")
#			end

		end
	end
end

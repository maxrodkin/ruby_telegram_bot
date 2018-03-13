require 'net/http'

token = '418120660:AAGFcvlIok7YXDxe1F-C7LBloVm1SA908PQ'#rodkin2bot

port = 80
host = 'api.telegram.org'
path = "https://api.telegram.org/bot418120660:AAGFcvlIok7YXDxe1F-C7LBloVm1SA908PQ/sendMessage?chat_id=265827416&text=Hi+Everyone"
req = Net::HTTP::Get.new(path, initheader = { 'Content-Type' => 'application/json'})
#req.body = '{"item": {"id":70, "name":"maxrodkin", "description":"'+message.text+'" }}'
response = Net::HTTP.new(host, port).start {|http| http.request(req) }
puts response.code
#bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")

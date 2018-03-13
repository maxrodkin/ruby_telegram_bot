require 'net/http'

token = '418120660:AAGFcvlIok7YXDxe1F-C7LBloVm1SA908PQ'#rodkin2bot

#port = 80
#host = '0323b81b.ngrok.io' # динамический адрес, меняется каждый раз при старте ngrok
port = 3000
host = 'localhost' # динамический адрес, меняется каждый раз при старте ngrok
path = "/api/v2/items/9999999"
req = Net::HTTP::Put.new(path, initheader = { 'Content-Type' => 'application/json'})
req.body = '{"item": {"name":"maxrodkin", "description":"hi5!","chat_id":"265827416","bot_id":"418120660:AAGFcvlIok7YXDxe1F-C7LBloVm1SA908PQ"}}'
puts req.body
response = Net::HTTP.new(host, port).start {|http| http.request(req) }
puts response.code

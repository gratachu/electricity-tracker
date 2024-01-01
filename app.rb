require 'net/http'
require 'uri'
require 'json'

LOOOP_DENKI_URL = "https://looop-denki.com/api/prices?select_area="
AREA_CODE = "09"

looop_url = LOOOP_DENKI_URL + AREA_CODE

response = Net::HTTP.get(URI.parse(looop_url))

if response.is_a?(Net::HTTPSuccess)
  json = JSON.parse(response)

  today_data = json["1"]
  tomorrow_data = json["2"]
else
  puts "API Error: #{response.code} #{response.message}"
end
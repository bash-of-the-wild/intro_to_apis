require 'http'

system "clear"
puts "Welcome to the Weather App"
puts "=" * 50
puts ""

print "Enter a City: "
city = gets.chomp
puts ""

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{ city }&units=imperial&appid=ad55a020f8382071e966f69d41d2a5a9")

weather_data = response.parse

temprature = weather_data["main"]["temp"]
low_temp = weather_data["main"]["temp_min"]
high_temp = weather_data["main"]["temp_max"]
description = weather_data["weather"][0]["description"]

puts "Today in #{ city }, it is currently #{ temprature } degrees with #{ description } weather."
puts "You can expect a high of #{ high_temp } and a low of #{ low_temp }"

puts ""
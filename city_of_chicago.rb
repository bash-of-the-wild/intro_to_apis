require "http"

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
data = response.parse

data.each do |employee_hash|
  puts ""
  puts employee_hash["name"]
  puts employee_hash["department"]
  puts employee_hash["annual_salary"]
  puts ""
  puts "=" * 50
end
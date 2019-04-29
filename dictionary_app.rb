require 'http'

running = true

while running
  system "clear"
  puts "Dictionary App, So I can drink and know things"
  puts "=" * 60
  puts ""

  print "Enter a Word: "
  input_word = gets.chomp

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=10&includeRelated=false&useCanonical=false&includeTags=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  definitions = response.parse

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  top_example = response.parse["text"]

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=5&typeFormat=IPA&api_key=9f63510ab680a9a2504370c0a530c846ba454b12337f0c6c0")

  pronunciations = response.parse

  puts ""
  puts "  DEFINITIONS"
  puts "=" * 60
  puts ""

  count = 1

  definitions.each do |definition_hash|
    puts "     #{count.to_s.rjust(3)}. #{definition_hash["text"]}"
    count += 1
  end

  puts ""
  puts "  TOP EXAMPLE"
  puts "=" * 60
  puts ""

  puts top_example

  puts ""
  puts "  PRONOUNCIATIONS"
  puts "=" * 60
  puts ""

  count = 1

  pronunciations.each do |pronunciation_hash|
    puts "     • #{pronunciation_hash["raw"]}"
  end

  puts ""
  puts "Prees enter to continue or 'q' to quit"
  ending_input = gets.chomp

  if ending_input == "q"
    running = false
  end
end

system "clear"
puts ""
puts "Thanks for using my app."


# Bonus code
# response = HTTP.get("https://api.wordnik.com/v4/word.json/pineapple/audio?useCanonical=false&limit=50&api_key=ac6099e63826b8650f05e22c4cc08baa2f21668e3f16176fd")
# `open #{response.parse[0]['fileUrl']}`


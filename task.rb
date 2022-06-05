def spin_words(sentence)
 clean_sentence = sentence.gsub(/[^a-z0-9\s]/i, '')
 words = clean_sentence.split(' ')
 p words
 reversed_sentence = []

 words.each do |word|
  if word.size >= 5
    reversed_sentence << word.reverse
  else
    reversed_sentence << word
  end
 end

 p reversed_sentence.join(' ')
end

puts "Enter your sentence:"
sentence = gets.chomp

spin_words(sentence)

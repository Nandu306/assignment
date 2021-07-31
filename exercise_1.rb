require 'json'
require 'open-uri'

def count_words(url)

  def extract(array, url)

    text_serialized = URI.open(url).read

    text_convert = JSON.parse(text_serialized)

    text = "#{text_convert['text']}"

    array << text

    extract(array, "#{text_convert['next_page']}") if text_convert.has_key?('next_page')

    array.join('')
  end


  def count(text)


    new_text = text.downcase.gsub(/[^a-z0-9\s]/i, '')

    new_text_removed = new_text.gsub("\n", " ")

    words = new_text_removed.split(' ')

    freq = Hash.new(0)

    words.each { |word| freq[word] += 1 }

    word_frequency = freq.sort.to_h

    sorted_word_frequency = word_frequency.sort_by { |word, count| [word, count] }

    sorted_word_frequency.each { |word, count| puts "#{word}: #{count}" }

  end


  count(extract([], url))

end




puts "What's the url that you want to process?"

url = gets.chomp

count_words(url)

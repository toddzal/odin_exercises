require 'pry'

def double_words_in_phrase(string)
  string_array = string.split(' ')

  string_array.map { |word| word * 2}
  string_array.join(' ')
  binding.pry
end

double_words_in_phrase("This is a test")
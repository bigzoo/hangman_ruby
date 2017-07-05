class Word
  @@word = String.new()
  define_method(:initialize) do |word|
    @@word = word
  end

  define_method(:has_letter) do |letter|
    @@word.include?(letter)
  end

  define_singleton_method(:word) do
    @@word
  end
end

class Letter
  @@selected_letters = String.new()

  define_method(:initialize) do |letter|
    @letter = letter
  end

  define_method(:add_letter) do |letter|
    @@selected_letters.concat(letter)
  end

  define_singleton_method(:all) do
    @@selected_letters
  end

  define_singleton_method(:clear) do
    @@selected_letters = ''
  end

  define_method(:has_letter) do |letter|
    @@selected_letters.include?(letter)
  end
end

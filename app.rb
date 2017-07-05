require('sinatra')
require('sinatra/reloader')
require('./lib/hangman')
also_reload('lib/**/*.rb')

get ('/') do
  erb(:index)
end
post ('/hangman') do
  word = params.fetch('word')
  Word.new(word)
  @word = Word.word()
  @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  erb(:hangman)
end
get ('/hangman/:letter') do
  @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  letter = params.fetch('letter')
  @word = Word.word()
  word = Word.new(@word)
  if word.has_letter(letter)
    @status = "The letter was found"
    Letter.new(letter).add_letter(letter)
    @selected_letters = Letter.all()
  else
    @status = "The letter was not found")
    @selected_letters = Letter.all()
  end

  erb(:hangman)
end

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
  @selected_letters = Letter.all()
  if word.has_letter(letter) && !@selected_letters.include?(letter)
    no = @word.to_s.count(letter)
    no.times() do
      Letter.new(letter).add_letter(letter)
      @status = "1The letter was found Failure Count remains = " + Letter.failure_count().to_s
      @selected_letters = Letter.all()
    end
  elsif word.has_letter(letter)
    @no = @word.to_s.count(letter)
    @selected_letters = Letter.all()
    @status = "The letter was found Failure Count remains = " + Letter.failure_count().to_s
  else
    @no = @word.to_s.count(letter)
    Letter.new_fail()
    @selected_letters = Letter.all()
    @status = "The letter was not found. Failure Count = " + Letter.failure_count().to_s
  end
  erb(:hangman)
end

require('rspec')
require('hangman')

describe(Word) do
  describe("#has_letter") do
    it('checks if letter is present in the word') do
      my_word = Word.new("cow")
      expect(my_word.has_letter('o')).to(eq(true))
    end
  end

  describe("#word") do
    it("return the word") do
      my_word = Word.new("cow")
      expect(Word.word()).to(eq("cow"))
    end
  end
end

describe(Letter) do
  before() do
    Letter.clear()
  end
  
  describe("#all") do
    it('selected letters is empty at first') do
      expect(Letter.all()).to(eq(''))
    end
  end

  describe("#add_letter") do
    it('concats the selected letter') do
      my_letter = Letter.new('r').add_letter('r')
      expect(Letter.all()).to(eq('r'))
    end
  end

  describe("#clear") do
    it('empties out the selected letters') do
      Letter.new('r').add_letter('r')
      Letter.clear()
      expect(Letter.clear()).to(eq(''))
    end
  end
end

class Hangman
  def initialize
    @letters = ('a'...'z').to_a
    @word = words.sample
  end
  
  def words
    [
      ["apple", "What fruit will keep the Dr. away?"],
      ["apple", "What fruit will keep the Dr. away?"],
      ["apple", "What fruit will keep the Dr. away?"],
      ["apple", "What fruit will keep the Dr. away?"],
      ["apple", "What fruit will keep the Dr. away?"]
    ]
  end

  def print_teaser 
    word_teaser = ""
    @word.first.size.times do
      word_teaser += "_ "
    end
    puts word_teaser
  end

  def make_guess
    puts "Enter a letter"
    guess = gets.chomp
  end
  

  def begin
    puts "New game started... your word is #{ @word.first.size } character long"
    print_teaser
    puts "Clue is #{ @word.last }"

      make_guess
  end
end

game = Hangman.new
game.begin
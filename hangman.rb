class Hangman
  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @guesses = 7
    @correct_guesses = []
    @word_teaser = ""

    @word.first.size.times do
      @word_teaser += "_ "
    end
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

  def print_teaser last_guess = nil

    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|

      if  letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end
    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @guesses > 0
    puts "Enter a letter"
    guess = gets.chomp

    good_guess = @word.first.include? guess


    if guess == "exit"
      puts "Thanks for playing"
    elsif good_guess
      puts "Good guess!"

      # @correct_guesses << guess
      # @letters.delete guess

      print_teaser guess

      if @word.first == @word_teaser.split.join
        puts "You win!"
      else
        make_guess
      end
    else
      @guesses -= 1
      puts "Sorry... you have #{ @guesses } guesses left, try again."
      make_guess
    end
  else
    puts "Game Over"
  end
  end
  

  def begin
    puts "New game started... your word is #{ @word.first.size } character long"
    puts "To exit game type 'exit'"
    print_teaser
    puts "Clue is #{ @word.last }"

      make_guess
  end
end

game = Hangman.new
game.begin
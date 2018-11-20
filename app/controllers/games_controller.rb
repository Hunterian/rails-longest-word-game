class GamesController < ApplicationController
  def new
    @alphabet = [('A'..'Z')].map { |i| i.to_a }[0]
    @game_letters = []
    @random_letters = 10.times { @game_letters << @alphabet.sample }
  end

  def score
    @word = params[:word]
    word_array = @word.split('')
    game_letters = params[:letters].split(' ')
    inclusion = true
    word_array.each do |letter|
      inclusion = inclusion && (game_letters.count(letter) >= word_array.count(letter))
    end
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @english_word
  end
end

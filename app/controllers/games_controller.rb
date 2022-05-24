require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = (('a'..'z').to_a).sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters]

    # if @letters.include?(@word)
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_check = URI.open(url).read
    word_hash = JSON.parse(word_check)
    @valid = word_hash['found']

    if @letters.include?(@word) && @letters == url
     @result = 'CONGRATULATIONS'
    else @result = "Sorry but #{@word} is not valid word"
    end
  end
end

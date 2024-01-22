require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    charset = Array('a'..'z')
    @letters = Array.new(10) { charset.sample.upcase }
  end

  def score
    # word needs to be an array too to be able to compare with letters and see if
    # the letters of the word match with the letters of the random letters array.
    # if they match, we can comapare with the API(just below)
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
      api_call = JSON.parse(URI.open(url).read)
      
    if params[:word] != param[:letters]
      @result = "Sorry but #{params[:word]} can't be built out of #{word}"
    elsif params[:word] == param[:letters]
      if params[:word] == dictionary
        @result = "Great! #{params[:word]} is a valid English word"
      elsif @result != dictionary
        @result = "Sorry but #{params[:word]} does not seem to be a valid English word"
      end
    end
  end
end

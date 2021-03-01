class PagesController < ApplicationController
  def new
    @alphabetic = ('a'..'z').to_a
    @letters = @alphabetic.sample(10)
  end

  def score
    @guess = params[:guess]
    response = RestClient.get"https://wagon-dictionary.herokuapp.com/#{@guess}"
    @result = JSON.parse(response)
    if @result["found"]
      @sentence = "#{@guess.upcase} is a viable word"
    else
      @sentence = "Sorry #{@guess.upcase} is not a viable word"
    end
  end
end

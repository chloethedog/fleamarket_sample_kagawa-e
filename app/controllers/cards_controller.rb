class CardsController < ApplicationController
  require "date"
  def new
    date = Date.today
    year = date.year
    after_year = year + 9
    @years = []
    year.upto(after_year) do |num|
      @years << num
    end
    @month = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
  end
end

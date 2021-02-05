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
    @month = []
    11.times do |num|
      num += 1
      @month << num
    end
  end
end

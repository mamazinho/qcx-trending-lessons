require 'net/http'
require 'json'

class TrendingController < ApplicationController
  def index
    if params['all'] == "true" then
      @questions = Question.order(:discipline).all
    else
      params = {}
      @questions = Question.select(:discipline, :daily_access).distinct.order(:discipline).first(10)
    end
    for q in @questions do
    end
  end
end

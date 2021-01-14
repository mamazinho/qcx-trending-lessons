require 'net/http'
require 'json'

class TrendingController < ApplicationController
  def index
    uri = URI('https://raw.githubusercontent.com/qcx/desafio-backend/master/questions.json')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
    
    response = http.request(request)
    puts('aaaaaaaaaa', response.body)
    @questions = JSON.parse(response.body)
  end
end

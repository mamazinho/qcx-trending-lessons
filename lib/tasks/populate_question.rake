desc 'Populate table Question'
task :populate_question => :environment do
  questions = get_json
  model = Question.create(questions)
end

def get_json

  require 'net/http'
  require 'json'

  uri = URI('https://raw.githubusercontent.com/qcx/desafio-backend/master/questions.json')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
  
  response = http.request(request)
  JSON.parse(response.body)

end
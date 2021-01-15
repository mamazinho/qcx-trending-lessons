desc 'Populate table QuestionAccess'
task :populate_question_access => :environment do
  questions = get_json
  for question in questions do
  save_in_database(question)
  end

end

def get_json

  require 'net/http'
  require 'json'

  uri = URI('https://raw.githubusercontent.com/qcx/desafio-backend/master/question_access.json')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})

  response = http.request(request)
  JSON.parse(response.body)

end

def save_in_database(question)
  @question = Question.find(question['question_id'])
  @question.questions_access.create(question_id: @question.id, date: Time.now, times_accessed: 24)
end
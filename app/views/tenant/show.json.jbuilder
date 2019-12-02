json.user @user
    json.questions @user.questions.each do |question|
    if !question.private
        json.extract! question, :id, :title
        json.answers question.answers.each do |answer|
            json.extract! answer, :id, :body
        end
    end
end
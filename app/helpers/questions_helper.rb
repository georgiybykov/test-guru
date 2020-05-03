module QuestionsHelper
  def question_header(question)
    if action_name.to_sym == :new
      "Create New #{question.test.title} Question"
    elsif action_name.to_sym == :edit
      "Edit #{question.test.title} Question"
    end
  end
end

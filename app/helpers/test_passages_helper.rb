module TestPassagesHelper
  def question_number(test_passage)
    "The Question #{test_passage.current_question_number} of #{test_passage.questions_count}."
  end
end

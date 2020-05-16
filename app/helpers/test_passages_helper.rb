module TestPassagesHelper
  def result_message(test_passage)
    test_passage.success? ? t('.success') : t('.failure')
  end

  def success_failure(test_passage)
    test_passage.success? ? 'success' : 'failure'
  end
end

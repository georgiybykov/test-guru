# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    test_passage.success? ? t('test_passages.result.success') : t('test_passages.result.failure')
  end

  def green_red(test_passage)
    test_passage.success? ? 'green' : 'red'
  end
end

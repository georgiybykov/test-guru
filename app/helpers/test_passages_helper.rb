# frozen_string_literal: true

module TestPassagesHelper
  def result_message(test_passage)
    test_passage.success? ? t('test_passages.result.success') : t('test_passages.result.failure')
  end

  def green_red(test_passage)
    test_passage.success? ? 'green' : 'red'
  end

  def time_left(test_passage)
    test = test_passage.test

    return unless test.with_timer?

    Time.zone.at(test_passage.created_at + test.passage_time - Time.current).strftime('%s')
  end
end

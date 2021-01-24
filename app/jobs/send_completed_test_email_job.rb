# frozen_string_literal: true

class SendCompletedTestEmailJob < ApplicationJob
  queue_as :default

  def perform(test_passage)
    TestsMailer.completed_test(test_passage).deliver_later
  end
end

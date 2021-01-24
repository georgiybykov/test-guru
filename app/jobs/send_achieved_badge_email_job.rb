# frozen_string_literal: true

class SendAchievedBadgeEmailJob < ApplicationJob
  queue_as :default

  def perform(assigned_badges, current_user)
    TestsMailer.achieved_badge(assigned_badges, current_user).deliver_later
  end
end

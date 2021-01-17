# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

  def achieved_badge(badges, user)
    @badges_names = badges_names_list(badges)
    @user = user

    mail to: user.email
  end

  private

  def badges_names_list(badges)
    badges
      .pluck(:name)
      .to_sentence
  end
end

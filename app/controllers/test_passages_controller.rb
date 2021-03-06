# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      SendCompletedTestEmailJob.set(wait: 5.seconds).perform_later(@test_passage)

      assigned_badges = Badges::AssignBadgesService
                          .new(test_passage: @test_passage, current_user: current_user)
                          .fetch_assigned_badges

      if assigned_badges.any?
        SendAchievedBadgeEmailJob.set(wait: 20.seconds).perform_later(assigned_badges, current_user)
      end

      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = Gists::CreateGistQuestionService.new(question: @test_passage.current_question).call

    if result.success?
      gist = gist_create(result.html_url)

      flash[:notice] = t('.success', url: view_context.link_to(t('links.gist'),
                                                               gist.gist_url,
                                                               target: '_blank',
                                                               rel: 'noopener'))
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def gist_create(url)
    Gist.create!(
      question: @test_passage.current_question,
      gist_url: url,
      user: current_user
    )
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

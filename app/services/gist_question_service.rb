class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params.to_json)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN']) # GitHubClient.new (-> /lib/clients/)
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title),
      public: true,
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

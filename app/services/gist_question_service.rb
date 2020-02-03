# frozen_string_literal: true

# GistQuestionService
class GistQuestionService
  Result = Struct.new(:call) do
    delegate :html_url, to: :call

    def success?
      call.html_url.present?
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params))
  end

  private

  def default_client
    GitHubClient.new
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
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

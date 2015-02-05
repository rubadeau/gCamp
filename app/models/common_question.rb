class CommonQuestion
  attr_reader :question, :answer, :slug

  def initialize(question, answer, slug)
    @question = question
    @answer = answer
    @slug = slug
  end
end

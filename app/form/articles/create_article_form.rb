class Articles::CreateArticleForm
  # include FormModule

  attr_reader :title, :content, :current_user

  def initialize(props)
    @title = props[:title]
    @content = props[:content]
    @current_user = props[:current_user]
  end

  def run
    current_user.articles.create!(title: title, content: content)
  end
end

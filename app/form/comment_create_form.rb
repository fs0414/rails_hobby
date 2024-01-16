class CommentCreateForm
  include ActiveModel::Model
  include ActiveModel::Attribute

  attribute :content, :string

  @article = Article.find(params[:article_id])

  def create_comment
    @article.comments.create(comment)
  end
end

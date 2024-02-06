class Api::ArticlesController < BaseController
  # before_action :set_article, only: %i[personal_article, update, destroy]
  before_action :set_article, only: %i[personal_article update destroy]

  def index
    articles = Article.all

    render json: articles
  end

  def personal_articles
    current_user_id = current_user.id
    articles_with_comments = current_user.articles.as_json(include: :comments)
    render json: { current_user: current_user_id, data: articles_with_comments }
  end

  def create
    article = Articles::CreateArticleForm.new(
      title: article_params[:title],
      content: article_params[:content],
      current_user: current_user
    ).run

    render json: article
  end

  def update
    @article.update!(article_params)
  end

  def destroy
    @article.destroy
    if @article.save
      render json: { message: 'article delete success' }
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    # @article = Article.find_by(id: params[:id])
    @article = Article.find(params[:id])
  end
end

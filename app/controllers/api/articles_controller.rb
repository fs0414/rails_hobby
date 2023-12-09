class Api::ArticlesController < BaseController
  before_action :set_article, only: %i[update, destroy]

  def index
    articles = Article.all
    render json: articles
  end

  def personal_article
    current_user_id = current_user.id
    articles = Article.where(user_id: current_user_id)
    render json: { current_user: current_user_id, data: articles }
  end

  def create
    article = Article.new(article_params)
    article[:user_id] = current_user.id

    begin
      article.save!
      render json: { data: article }
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }
    end
  end

  def update
    @article.update(article_params)
    begin
      @article.save!
      render json: { data: @article }
    rescue ActiveRecode::RecodeInvalid => e
      render json: { errors: e.record.errors.full_messages }
    end
  end

  def destroy
    @article.destroy
    begin
      @article.save!
      render json: { message: 'article delete success' }
    rescue ActiveRecode::RecodeInvalid => e
      render json: { errors: e.recode.errors.full_messages }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

  def set_article
    @article = Article.find_by(id: params[:id])
  end
end

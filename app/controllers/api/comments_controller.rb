class Api::CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    articles = Article.find(params[:article_id])
    comment = articles.comments.create(comment_params)
    comment.user_id = current_user.id
    begin
      comment.save!
      render json: { data: comment }
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.record.errors.full_messages }
    end
  end

  def destroy
    @comment.destroy
    begin
      @comment.save
      render json: { message: 'comment delete success' }
    rescue ActiveRecord::RecordInvalid => e
      render json: { errors: e.recode.errors.full_messages }
    end
  end

  private

  def comment_params
    params.permit(:content, :user_id)
  end

  def set_comment
    article = Article.find(params[:article_id])
    @comment = article.comments.find(params[:id])
  end
end

class Api::CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    articles = Article.find(params[:article_id])
    comment = articles.comments.create(comment_params)
    comment.user_id = current_user.id

    # 別記法
    # comment = current_user.comments.create(comment_params)
    # comment.article_id = params[:article_id]

    if comment.save
      render json: { data: comment }
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    if @comment.save
      render json: { message: 'comment delete success' }
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity

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

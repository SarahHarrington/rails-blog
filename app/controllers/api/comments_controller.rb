module Api
  class CommentsController < ApplicationController
    def create
      @comment = Comment.new(comment_params)
      if @comment.save
        render json: @comment
      else
        render status: 400
      end
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end

    def index
      @article = Article.find(params[:article_id])
      render json: @article.comments
    end



    private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :article_id)
    end
  end
end
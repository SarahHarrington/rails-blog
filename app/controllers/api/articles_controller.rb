module Api
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
      render json: @articles
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        render json: @article
      else
        render status: 400
      end
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
    end

    private

    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
end
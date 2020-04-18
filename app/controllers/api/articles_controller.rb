module Api
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
      render json: @articles
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

    private

    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
end
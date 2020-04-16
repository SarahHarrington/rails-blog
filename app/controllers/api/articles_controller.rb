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
        redirect_to @article
      else
        render 'new'
      end
    end
  end
end
module Api::V1
  class ArticlesController < ApplicationController
    before_action :set_source, only: [:index, :show, :update, :destroy]
    before_action :set_article, only: [:show, :update, :destroy]

    # GET /v1/sources/:source_id/articles
    def index
      @articles = @source.articles

      render json: @articles
    end

    # GET /v1/sources/:source_id/articles/:id
    def show
      render json: @article
    end

    # POST /v1/sources/:source_id/articles
    def create
      @article = Article.new(article_params)

      if @article.save
        render json: @article, status: :created#, location: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/sources/:source_id/articles/:id
    def update
      if @article.update(article_params)
        render json: @article
      else
        render json: @article.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/sources/:source_id/articles/:id
    def destroy
      @article.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      def set_source
        @source = Source.find(params[:source_id])
      end

      # Only allow a trusted parameter "white list" through.
      def article_params
        params.permit(:title, :url, :summary, :top_img, :pub_date, :keywords, :source_id)
      end
  end
end

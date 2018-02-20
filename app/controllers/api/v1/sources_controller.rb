module Api::V1
  class SourcesController < ApplicationController
    before_action :set_source, only: [:show, :update, :destroy]

    # GET /v1/sources
    def index
      @sources = Source.all

      render json: @sources
    end

    # GET /v1/sources/:id
    def show
      render json: @source
    end

    # POST /v1/sources
    def create
      @source = Source.new(source_params)

      if @source.save
        render json: @source, status: :created#, location: @source
      else
        render json: @source.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/sources/:id
    def update
      if @source.update(source_params)
        render json: @source
      else
        render json: @source.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/sources/:id
    def destroy
      @source.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_source
        @source = Source.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def source_params
        params.permit(:name, :website)
      end
  end
end

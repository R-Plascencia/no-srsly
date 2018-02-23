require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :routing do
  let(:url) { 'http://lvh.me/api/v1/' }
  let(:api_ver) { 'v1' }

  describe 'routing' do
    # it 'routes to #index' do
    #   expect(:get => url + 'articles')
    #     .to route_to("api/#{api_ver}/articles#index")
    # end


    # it 'routes to #show' do
    #   expect(:get => url + 'articles/1')
    #     .to route_to("api/#{api_ver}/articles#show", :id => '1')
    # end

    it 'routes to #create' do
      expect(:post => url + 'articles')
        .to route_to("api/#{api_ver}/articles#create")
    end

    it 'routes to #find' do
      expect(:post => url + 'articles/find')
        .to route_to("api/#{api_ver}/articles#find")
    end

    # it 'routes to #update via PUT' do
    #   expect(:put => url + 'articles/1')
    #     .to route_to("api/#{api_ver}/articles#update", :id => '1')
    # end

    # it 'routes to #update via PATCH' do
    #   expect(:patch => url + 'articles/1')
    #     .to route_to("api/#{api_ver}/articles#update", :id => '1')
    # end

    # it 'routes to #destroy' do
    #   expect(:delete => url + 'articles/1')
    #     .to route_to("api/#{api_ver}/articles#destroy", :id => '1')
    # end
  end

  describe 'routing through source' do

    it 'routes to #index' do
      expect(:get => url + 'sources/1/articles')
        .to route_to("api/#{api_ver}/articles#index", :source_id => '1')
    end


    it 'routes to #show' do
      expect(:get => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#show", :source_id => '1', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => url + 'sources/1/articles')
        .to route_to("api/#{api_ver}/articles#create", :source_id => '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#update", :source_id => '1', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#update", :source_id => '1', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#destroy", :source_id => '1', :id => '1')
    end

  end
end

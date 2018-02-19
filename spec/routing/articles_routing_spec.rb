require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :routing do
  let(:url) { 'http://api.lvh.me/v1/' }
  let(:api_ver) { 'v1' }

  describe 'routing' do
    it 'routes to #index' do
      expect(:get => url + 'articles')
        .to route_to("api/#{api_ver}/articles#index", :subdomain => 'api')
    end


    it 'routes to #show' do
      expect(:get => url + 'articles/1')
        .to route_to("api/#{api_ver}/articles#show", :subdomain => 'api', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => url + 'articles')
        .to route_to("api/#{api_ver}/articles#create", :subdomain => 'api')
    end

    it 'routes to #update via PUT' do
      expect(:put => url + 'articles/1')
        .to route_to("api/#{api_ver}/articles#update", :subdomain => 'api', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => url + 'articles/1')
        .to route_to("api/#{api_ver}/articles#update", :subdomain => 'api', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => url + 'articles/1')
        .to route_to("api/#{api_ver}/articles#destroy", :subdomain => 'api', :id => '1')
    end
  end

  describe 'routing through source' do

    it 'routes to #index' do
      expect(:get => url + 'sources/1/articles')
        .to route_to("api/#{api_ver}/articles#index", :subdomain => 'api', :source_id => '1')
    end


    it 'routes to #show' do
      expect(:get => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#show", :subdomain => 'api', :source_id => '1', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => url + 'sources/1/articles')
        .to route_to("api/#{api_ver}/articles#create", :subdomain => 'api', :source_id => '1')
    end

    it 'routes to #update via PUT' do
      expect(:put => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#update", :subdomain => 'api', :source_id => '1', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#update", :subdomain => 'api', :source_id => '1', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => url + 'sources/1/articles/1')
        .to route_to("api/#{api_ver}/articles#destroy", :subdomain => 'api', :source_id => '1', :id => '1')
    end

  end
end

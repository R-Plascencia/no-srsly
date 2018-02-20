require 'rails_helper'

RSpec.describe Api::V1::SourcesController, type: :routing do
  describe 'routing' do
    let(:url) { 'http://api.lvh.me/v1' }
    let(:api_ver) { 'v1' }

    it 'routes to #index' do
      expect(:get => url + '/sources').to route_to("api/#{api_ver}/sources#index", :subdomain => 'api')
    end


    it 'routes to #show' do
      expect(:get => url + '/sources/1')
        .to route_to("api/#{api_ver}/sources#show", :subdomain => 'api', :id => '1')
    end


    it 'routes to #create' do
      expect(:post => url + '/sources')
        .to route_to("api/#{api_ver}/sources#create", :subdomain => 'api')
    end

    it 'routes to #update via PUT' do
      expect(:put => url + '/sources/1')
        .to route_to("api/#{api_ver}/sources#update", :subdomain => 'api', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => url + '/sources/1')
        .to route_to("api/#{api_ver}/sources#update", :subdomain => 'api', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => url + '/sources/1')
        .to route_to("api/#{api_ver}/sources#destroy", :subdomain => 'api', :id => '1')
    end

  end
end

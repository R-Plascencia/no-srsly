require 'rails_helper'

RSpec.describe Api::V1::SourcesController, type: :controller do
  let(:source) { FactoryBot.create(:source) }
  let(:valid_attributes) do
    {
      :name => 'A New Source',
      :website => 'www.goodnews.com'
    }
  end

  let(:invalid_attributes) do
    {
      :source => {
        :name => 'A New Source',
        :website => 'www.goodnews.com'
      }
    }
  end

  describe 'GET #index' do
    before {  get :index, params: {} }

    it 'returns a success response' do
      expect(response).to be_success
    end

    it 'returns an http success' do
      expect(response).to have_http_status :ok
    end

    it 'returns all sources' do
      expect(json_response.size).to eq Source.count
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: source.id } }
    it 'returns a success response' do
      expect(response).to be_success
    end

    it 'returns an http success' do
      expect(response).to have_http_status :ok
    end

    it 'returns the requested source' do
      expect(json_response[:id]).to eq source.id
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before { post :create, params: valid_attributes }

      it 'renders a JSON response with the new source' do
        expect(response).to have_http_status :created
        expect(response.content_type).to eq 'application/json'
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new source' do
        post :create, params: {source: invalid_attributes}
        expect(response).to have_http_status :unprocessable_entity
        expect(response.content_type).to eq 'application/json'
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          :name => 'A News Source',
          :website => 'www.goodnewsalways.com',
          :id => source.id
        }
      end

      before { put :update, params: new_attributes }

      it 'updates the requested source' do
        source.reload
        expect(source.name).to eq 'A News Source'
        expect(source.website).to eq 'www.goodnewsalways.com'
      end

      it 'renders a JSON response with the source' do
        expect(response).to have_http_status :ok
        expect(response.content_type).to eq 'application/json'
      end
    end

    context 'with invalid params' do
      let(:bad_attributes) do
        {
          :website => 'lalala',
          :id => source.id
        }
      end
      before { put :update, params: bad_attributes }

      it 'renders a JSON response with errors for the source' do
        expect(response).to have_http_status :unprocessable_entity
        expect(response.content_type).to eq'application/json'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested source' do
      s = FactoryBot.create(:source)
      expect {
        delete :destroy, params: {id: s.id}
      }.to change(Source, :count).by(-1)
    end
  end

end

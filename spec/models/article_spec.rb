require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:source) { FactoryBot.create(:source) }
  subject { FactoryBot.create(:article, source_id:source.id) }

  describe 'Model Validation' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
  end

  describe 'Relations' do
    it { should belong_to :source } 
  end

  describe 'Validity' do
    it 'has attributes' do
      expect(Article.new).to_not be_valid
    end

    it 'needs a title' do
      expect(Article.new(:url => 'www.test.com')).to_not be_valid
    end

    it 'needs a link' do
      expect(Article.new(:title => 'Test title')).to_not be_valid
    end

    it 'is valid when all attributes are valid' do
      expect(subject).to be_valid
    end
  end

  describe 'Defaults' do
    let(:article) { Article.new(:title => 'Test defaults', :url => 'www.default.com') }

    it 'defaults summary' do
      expect(article.summary).to eq 'Click for details'
    end

    it 'defaults keywords to blank' do
      expect(article.keywords).to be_empty
    end
  end
end

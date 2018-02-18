require 'rails_helper'

RSpec.describe Source, type: :model do
    subject { FactoryBot.create(:source) } 

    describe 'Model Validation' do
        it { should validate_presence_of :name }
        it { should validate_presence_of :website }
        it { should validate_uniqueness_of :name }
        it { should validate_uniqueness_of :website }
    end

    describe 'Validity' do
        it 'has attributes' do
            expect(Source.new).to_not be_valid
        end

        it 'needs website with proper format' do
            source = Source.new(:name => 'Test Source', :website => 'testsource.com')
            expect(source).to_not be_valid
        end

        it 'is valid with name and proper website' do
            expect(subject).to be_valid
        end
    end

end

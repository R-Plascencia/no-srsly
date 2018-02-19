FactoryBot.define do
    sequence :name do |n|
        "Test Source#{n}"
    end

    sequence :website, :aliases => [:url] do |n|
        "www.testsite#{n}.com"
    end

    factory :source do
        name
        website
    end

    factory :article do
        source_id 1
        title 'Test title'
        summary 'Description of test title'
        top_img 'img1.jpg'
        url
        keywords 'word1, word2, word3'
        pub_date Date.new(2018, 01, 01)
    end
end

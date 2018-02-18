FactoryBot.define do
    sequence :name do |n|
        "Test Source#{n}"
    end

    sequence :website do |n|
        "www.testsource#{n}.com"
    end

    factory :source do
        name
        website
    end
end

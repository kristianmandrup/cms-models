# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :block, class: 'Cms::Models::Block' do
    name { Faker::Lorem.characters(10) }
    title { Faker::Name.name }
    content { Faker::Lorem.paragraph(10) }
    categories { Faker::Lorem.words(2) }
    tags { Faker::Lorem.words(2) }
    description { Faker::Lorem.sentence }
    position { 1 }
  end
end
